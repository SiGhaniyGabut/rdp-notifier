# RDP Notifier for Windows
---

> Built with Ruby 3.1, UltraMSG API, and NGROK

RDP Notifier is a simple script to notify newest Hostname and Port when your PC/Server turned on, or restarted. This will send you a message to your WhatsApp number using UltraMSG API.

Since free plan NGROK always regenerate Hostname and Port whenever agents restarted, this script will send you a message with the newest once.

Using NGROK means you can remote PC **WITHOUT** port forwarding (on your router). This can be useful, more secure than exposing your PC through internet, and less-pain if your **ISP block some ports!** (like my ISP).

## Installation

Notes that this project using Ruby and NGROK Installed on your system. For easy installation, you can use Chocolatey for Windows to install them.

Refer to this link for installation:
- Ruby - https://community.chocolatey.org/packages/ruby
- NGROK - https://community.chocolatey.org/packages/ngrok

For Chocolatey Installation, refer to this link:
- https://chocolatey.org/install

For UltraMSG Registration, refer to this link:
- https://ultramsg.com

UltraMSG has a free plan: **100 messages per day**. Use this plan only for RDP Notifier.

## Usage

Your UltraMSG API Key and UltraMSG Channel ID must provided in Environment Variables. Get it both from UltraMSG Dashboard.

Please follow this Environment Variables naming convention for easy to use this script without changing it:

```sh
WHATSAPP_INSTANCE_ID # Your UltraMSG instance ID
WHATSAPP_CHANNEL_ID # Your UltraMSG channel ID
WHATSAPP_NUMBER # Notified number (your number)
COMPUTERNAME # Your PC name (verify it's existance by type 'echo %COMPUTERNAME%' on CMD. If it's not exist, create it)
```

> Consider to use different number for Whatsapp notified to and Whatsapp used to send message (UltraMSG number), even though you can use the same number for both.

NGROK has to be service, so you can use it without login to your PC and start it manually. Follow this link to start NGROK as service:

- https://ngrok.com/docs/secure-tunnels/ngrok-agent/installing-as-a-service/

ngrok.yml example configuration:

```yml
version: 2
authtoken: NGROK_AUTH_TOKEN
tunnels:
  rdp:
    proto: tcp
    addr: 3389
```
## Start RDP Notifier

If you have completed the installation, you can start sending NGROK Hostname and Port information only by clicking `send.bat` file.

Since this goals is start RDP Notifier as a service, you can use NSSM (Non-Sucking Service Manager). Follow this link to install it:

- https://nssm.cc/download

Once installed, initialize RDP Notifier by running this command on CMD:

```sh
nssm install RDPNotifier
```

GUI editor will appear. Follow this instructions:

1. Fill the path to `send.bat` file.
2. At *Log on* tab, choose *This account* and fill your Windows username and password.
3. At *Process tab*, change priority to High.
4. Click *Install service*.

To start RDP Notifier, run this command on CMD:

```sh
nssm start RDPNotifier
```

Test it by restarting your PC and check your Whatsapp.

## Next Step?
Make it available for Linux and MacOS.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -am 'Add some your-feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
