git clone https://github.com/tylersuzukinelson/OFiDT.git
cd OFiDT/
git clone https://github.com/idonethis/didit-cli-client.git
cd didit-cli-client/
bundle install
cd ..
# Set up RVM so Ruby works with launch daemon
ruby_version=$(which ruby | grep -oE "ruby-\d+\.\d+\.\d+")
rvm alias create "OFiDT" "$ruby_version@OFiDT"
echo "Time to configure your iDoneThis. You will need your API token from https://idonethis.com/api/token/"
echo "When you have entered your API token, click the enter/return key twice."
$rvm_path/wrappers/OFiDT/ruby ./didit-cli-client/didit.rb
echo "Assuming no errors, installation complete."