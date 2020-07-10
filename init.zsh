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

    ln -fs $P6_DFZ_SRC_DIR/$USER/home-private/gcloud .config/gcloud
    ln -fs $P6_DFZ_SRC_DIR/$USER/home-private/gsutil .gsutil
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

p6df::prompt::gcp::line() {

  p6_gcp_prompt_info
}

## XXX: move to p6gcp
p6_gcp_prompt_info() {

  # XXX: pick active one
  local out=$(gcloud projects list | tail -1)
  local project_id=$(p6_echo "$out" | awk '{print $1}')
  local name=$(p6_echo "$out" | awk '{print $2}')
  local project_number=$(p6_echo "$out" | awk '{print $3}')

  if ! p6_string_blank "$name"; then
    p6_return_str "gcp:    $name ($project_id/$project_number)"
  fi
}

# gcloud auth login
# gcloud config set project PROJECT_ID
# gcloud projects list
# gcloud projects describe p6m7g8
# gcloud configure-docker # Docker credential helper