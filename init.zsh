######################################################################
#<
#
# Function: p6df::modules::gcp::version()
#
#>
#####################################################################
p6df::modules::gcp::version() { echo "0.0.1" }

######################################################################
#<
#
# Function: p6df::modules::gcp::deps()
#
#>
######################################################################
p6df::modules::gcp::deps() { ModuleDeps=() }

######################################################################
#<
#
# Function: p6df::modules::gcp::external::brew()
#
#>
######################################################################
p6df::modules::gcp::external::brew() {

  brew cask install google-cloud-sdk
}

######################################################################
#<
#
# Function: p6df::modules::gcp::langs()
#
#>
######################################################################
p6df::modules::gcp::langs() {

  gcloud components install anthoscli beta
}

######################################################################
#<
#
# Function: p6df::modules::gcp::home::symlink()
#
#>
######################################################################
p6df::modules::gcp::home::symlink() {

    ln -fs $P6_DFZ_SRC_DIR/$USER/home-private/gcp .gcp
}

######################################################################
#<
#
# Function: p6df::modules::gcp::init()
#
#>
######################################################################
p6df::modules::gcp::init() {

    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
}