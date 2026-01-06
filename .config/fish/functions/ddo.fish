function ddo --description "Download from DigitalOcean Spaces by UUID"
  # Parse arguments
  argparse 'v/verbose' -- $argv
  or return 1

  # Load credentials from external config
  if test -f ~/.config/fish/ddo_config.fish
    source ~/.config/fish/ddo_config.fish
  else
    echo "Error: ~/.config/fish/ddo_config.fish not found"
    echo "Create it with your DO credentials"
    return 1
  end

  set TEMP_DIR "./temp_download"

  if test (count $argv) -eq 0
    echo "Usage: ddo [--verbose|-v] <UUID>"
    return 1
  end

  set UUID $argv[1]
  set OUTPUT_ZIP "$UUID.zip"
  set S3_PATH "s3://$DO_SPACE_NAME/captures/$UUID/"

  # Create temp directory with UUID subdirectory
  mkdir -p "$TEMP_DIR/$UUID"

  # Download
  if set -q _flag_verbose
    echo "Downloading from DigitalOcean Spaces..."
    echo "Path: $S3_PATH"

    s3cmd sync --recursive --progress \
      --access_key=$DO_ACCESS_KEY \
      --secret_key=$DO_SECRET_KEY \
      --host=$DO_REGION.digitaloceanspaces.com \
      --host-bucket="%(bucket)s.$DO_REGION.digitaloceanspaces.com" \
      "$S3_PATH" "$TEMP_DIR/$UUID/"
  else
    # Quiet mode - show only download progress percentage
    echo -n "Downloading... "

    s3cmd sync --recursive --progress \
      --access_key=$DO_ACCESS_KEY \
      --secret_key=$DO_SECRET_KEY \
      --host=$DO_REGION.digitaloceanspaces.com \
      --host-bucket="%(bucket)s.$DO_REGION.digitaloceanspaces.com" \
      "$S3_PATH" "$TEMP_DIR/$UUID/" 2>&1 | while read -l line
    # Extract file count or percentage info
    if string match -qr '\[([0-9]+) of ([0-9]+)\]' $line
      set -l matches (string match -r '\[([0-9]+) of ([0-9]+)\]' $line)
      set -l current $matches[2]
      set -l total $matches[3]
      set -l percent (math "round($current / $total * 100)")
      echo -ne "\rDownloading... $percent% ($current/$total files)"
    end
  end
  echo # New line after completion
end

if test $status -eq 0
  if set -q _flag_verbose
    echo "\nDownload complete. Creating zip file..."
  end

  # Zip from temp directory to preserve UUID folder structure
  pushd $TEMP_DIR > /dev/null
  if set -q _flag_verbose
    zip -r ../$OUTPUT_ZIP $UUID
  else
    zip -rq ../$OUTPUT_ZIP $UUID
  end
  popd > /dev/null

  rm -rf $TEMP_DIR

  if not set -q _flag_verbose
    echo "✓ Saved to $OUTPUT_ZIP"
  else
    echo "Zip file created: $OUTPUT_ZIP"
    echo "Cleaning up temporary files..."
    echo "Done! Extract to see $UUID/ folder with all files."
  end
else
  echo "Download failed."
  return 1
end
end
