NVIM_CONFIG_DEST = $HOME/.config/nvim
# current directory
NVIM_CONFIG_SOURCE = $(pwd)/nvim
NVIM_SAVE = $(pwd)/nvim_save

save_existing_config() {
    echo "Saving nvim config"
    cp -r $NVIM_CONFIG_DEST $NVIM_SAVE
}

remove_existing_config() {
    echo "Removing existing nvim config"
    rm -rf $NVIM_CONFIG_DEST
}

copy_config() {
    echo "Copying nvim config"
    cp -r $NVIM_CONFIG_SOURCE $NVIM_CONFIG_DEST
}

creating_link() {
    echo "Creating link"
    ln -s $NVIM_CONFIG_DEST $NVIM_CONFIG_SOURCE
}

# check if nvim folder exists
if [ ! -d "$NVIM_CONFIG" ]; then
    copy_config
else
    save_existing_config
    remove_existing_config
    copy_config
fi

creating_link
