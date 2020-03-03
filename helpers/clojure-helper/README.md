## clojure-helper
This helper image is used for building and testing clojure applications.
It includes:

- [OpenJDK 8][openjdk]
- [Leiningen][lein] 2.8.1

[openjdk]: http://openjdk.java.net/
[leiningen]: https://leiningen.org/

### Build
The build of the image itself is realized by Jenkins. Only the compiled application/service will be added to the registry. The helper is not supposed to be promoted to production deployments.

### Usage
The helper can be used calling ```h_clojure``` the k8 agent. The helper-name corresponds to the file name in the k8sagent library found in directory 
```
agent {
    kubernetes(k8sagent(name: 'base+s_<builder_size>+h_clujure', label: 'jnlp', cloud: 'kubernetes'))
  }
```
