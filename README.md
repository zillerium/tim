## TIM - Golang

[![Join the chat at https://gitter.im/tim-coin/tim](https://badges.gitter.im/tim-coin/tim.svg)](https://gitter.im/tim-coin/tim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Official golang implementation of the tim protocol.(Modified by TIM - Copyright notices maintained in respective files for Golang, Google, Zack Guo, Snappy, John, Twitter, Prometheus,Ethereum )

[![API Reference](
https://camo.githubusercontent.com/915b7be44ada53c290eb157634330494ebe3e30a/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6c616e672f6764646f3f7374617475732e737667
)](https://godoc.org/github.com/tim-coin/tim)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/tim-coin/tim?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Alpha Binaries are available for Mac OSX and Ubuntu 14+ LTS


Binary archives are published at http://timdev.io/downloads/.





## Running the binary

For prerequisites and detailed build instructions please read the
[Installation Instructions](https://github.com/tim-coin/tim/wiki/Building-alpha)
on the wiki.

## Network Go-Live in November 2018


## Planned Executables - TIM will be interoperable with Go-Ethereum libraries for ease of development

The tim project will come with several wrappers/executables found in the `cmd` directory.

| Command    | Description |
|:----------:|-------------|
| **`timd`** | Our main tim CLI client. It is the entry point into the tim network (main-, test- or private net), capable of running as a full node (default) archive node (retaining all historical state) or a light node (retrieving data live). It can be used by other processes as a gateway into the tim network via JSON RPC endpoints exposed on top of HTTP, WebSocket and/or IPC transports. `timd --help` and the [CLI Wiki page](https://github.com/tim-coin/tim/wiki/Command-Line-Options) for command line options. |
| `abigen` | Source code generator to convert tim contract definitions into easy to use, compile-time type-safe Go packages. It operates on plain [tim contract ABIs](https://github.com/tim-coin/wiki/wiki/tim-Contract-ABI) with expanded functionality if the contract bytecode is also available. However it also accepts Solidity source files, making development much more streamlined. Please see our [Native DApps](https://github.com/tim-coin/tim/wiki/Native-DApps:-Go-bindings-to-tim-contracts) wiki page for details. |
| `bootnode` | Stripped down version of our tim client implementation that only takes part in the network node discovery protocol, but does not run any of the higher level application protocols. It can be used as a lightweight bootstrap node to aid in finding peers in private networks. |
| `tvm` | Developer utility version of the TVM (tim Virtual Machine) that is capable of running bytecode snippets within a configurable environment and execution mode. Its purpose is to allow isolated, fine-grained debugging of TVM opcodes (e.g. `tvm --code 60ff60ff --debug`). |
| `timdrpctest` | Developer utility tool to support our [tim/rpc-test](https://github.com/tim-coin/rpc-tests) test suite which validates baseline conformity to the [tim JSON RPC](https://github.com/tim-coin/wiki/wiki/JSON-RPC) specs. Please see the [test suite's readme](https://github.com/tim-coin/rpc-tests/blob/master/README.md) for details. |
| `rlpdump` | Developer utility tool to convert binary RLP ([Recursive Length Prefix](https://github.com/tim-coin/wiki/wiki/RLP)) dumps (data encoding used by the tim protocol both network as well as consensus wise) to user friendlier hierarchical representation (e.g. `rlpdump --hex CE0183FFFFFFC4C304050583616263`). |
| `swarm`    | swarm daemon and tools. This is the entrypoint for the swarm network. `swarm --help` for command line options and subcommands. See https://swarm-guide.readthedocs.io for swarm documentation. |
| `puppetim`    | a CLI wizard that aids in creating a new tim network. |

## License

The tim library (i.e. all code outside of the `cmd` directory) is licensed under the
[GNU Lesser General Public License v3.0](https://www.gnu.org/licenses/lgpl-3.0.en.html), also
included in our repository in the `COPYING.LESSER` file.

The tim binaries (i.e. all code inside of the `cmd` directory) is licensed under the
[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html), also included
in our repository in the `COPYING` file.
