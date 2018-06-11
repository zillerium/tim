## TIM - Golang

[![Join the chat at https://gitter.im/tim-coin/tim](https://badges.gitter.im/tim-coin/tim.svg)](https://gitter.im/tim-coin/tim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Official golang implementation of the tim protocol.(Modified by TIM - Copyright notices maintained in respective files for Golang, Google, Zack Guo, Snappy, John, Twitter, Prometheus,Ethereum )

[![API Reference](
https://camo.githubusercontent.com/915b7be44ada53c290eb157634330494ebe3e30a/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6c616e672f6764646f3f7374617475732e737667
)](https://godoc.org/github.com/tim-coin/tim)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/tim-coin/tim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## [Alpha](https://github.com/tim-coin/alpha) Binaries are available for Mac OSX and Ubuntu 14+ LTS


Binary archives are published at http://timdev.io/downloads/.





## Running the binary

For prerequisites and detailed build instructions please read the
[Installation Instructions](https://github.com/tim-coin/tim/wiki/Building-Environment-for-Alpha)
on the wiki.

## Network Go-Live in November 2018


## Planned Executables - TIM will be interoperable with Go-Ethereum libraries for ease of development

The tim project will come with several wrappers/executables found in the `cmd` directory.

| Command    | Description |
|:----------:|-------------|
| **`timd`** | Additional flags to run as graph miner, consensus miner or Challenger nodes |
| `abigen` | Very similar to Go-Ethereum |
| `bootnode` | Very similar to Go-Ethereum for discovery node for Graph Miners or Consensus Miners|
| `tvm` | Additional features of running geo-fenced contracts |
| `timdrpctest` | Additional features to run RPC tests in both comms layers |
| `rlpdump` | Very similar to Go-Ethereum. |
| `swarm`    | Additional features of optional entry in one or two layers or both layers of swarm network of TIM |
| `puppetim`    | Similar to Go_ethereum, a CLI wizard that aids in creating a new tim network, but also for Graph Layer and/or Consensus Layers or Both. |

## License

The tim library (i.e. all code outside of the `cmd` directory) is licensed under the
[GNU Lesser General Public License v3.0](https://www.gnu.org/licenses/lgpl-3.0.en.html), also
included in our repository in the `COPYING.LESSER` file.

The tim binaries (i.e. all code inside of the `cmd` directory) is licensed under the
[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html), also included
in our repository in the `COPYING` file.

The tim static binaries (i.e. all code inside of the `cmd/static` directory) is licensed under the
[TIM Enterprise License](https://www.talking.im/user-terms-and-conditions), also included
in our repository in the `COPYING` file.
