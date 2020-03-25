## clojure-helper
This helper image is used for building and testing clojure applications.
It includes:

- [OpenJDK 8][openjdk]
- [Leiningen][lein] 2.8.1

[openjdk]: http://openjdk.java.net/
[leiningen]: https://leiningen.org/

### Build
The build of the image itself is realized by Jenkins. Only the compiled application/service will be added to the registry. The helper is not supposed to be promoted to production deployments as such.

### Usage
The helper can be used calling the ```h_clojure``` the k8 agent. This can be configured by specifying the name at ```environments.<env>.agent.name```. Example:
```
environments.generic.agent.name: 's_helper+h_clojure'
```
