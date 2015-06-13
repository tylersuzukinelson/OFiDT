git clone https://github.com/tylersuzukinelson/OFiDT.git
cd OFiDT/
git clone https://github.com/idonethis/didit-cli-client.git
cd didit-cli-client/
bundle install
cd ..
echo "Time to configure your iDoneThis. You will need your API token from https://idonethis.com/api/token/"
echo "When you have entered your API token, click the enter/return key twice."
./didit-cli-client/didit.rb
echo "Assuming no errors, installation complete."