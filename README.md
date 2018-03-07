# nextflow-boilerplate
Boilerplate code for Nextflow pipelines

# Installation

Clone this repository

```
git clone https://github.com/stevekm/nextflow-boilerplate.git
cd nextflow-boilerplate
```

Install Nextflow in the local directory

```
make install
```

(Optional) Test that it worked

```
make test
```

# Contents

- `main.nf`: main Nextflow pipeline file

- `nextflow.config`: Nextflow configuration file

- `bin`: directory for scripts to use inside the Nextflow pipeline; its contents will be prepended to your `PATH` when pipeline tasks are executed

- `Makefile`: shortcuts to common pipeline actions

# Software Requirements

- Java 8
