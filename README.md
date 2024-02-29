# Creating an application with a Go code sample

**Note:** The Go code sample uses the **8080** HTTP port.

Before you begin creating an application with this `devfile` code sample, it's helpful to understand the relationship between the `devfile` and `Dockerfile` and how they contribute to your build. You can find these files at the following URLs:

- [Go Sample `devfile.yaml`](https://github.com/devfile-samples/devfile-sample-go-basic/blob/v2.0.0/devfile.yaml)
- [Go Sample `Dockerfile`](https://github.com/devfile-samples/devfile-sample-go-basic/blob/v2.0.0/docker/Dockerfile)
- [Parent Go Stack `devfile.yaml`](https://github.com/devfile/registry/blob/main/stacks/go/2.2.0/devfile.yaml)

This code sample inherits the components and commands of the specified parent devfile. The sample devfile overrides and extends parts of the parent devfile, in this case parts of the `deploy` component.

1. The parent `devfile.yaml` file has a [`build` component](https://github.com/devfile/registry/blob/main/stacks/go/2.2.0/devfile.yaml#L22-L28) that points to your `Dockerfile`.
2. The [`docker/Dockerfile`](https://github.com/devfile-samples/devfile-sample-go-basic/blob/v2.0.0/docker/Dockerfile) contains the instructions you need to build the code sample as a container image.
3. The `devfile.yaml` [`deploy` component](https://github.com/devfile-samples/devfile-sample-go-basic/blob/v2.0.0/devfile.yaml#L21-L33) overrides the parent `deploy` component and points to a `deploy.yaml` file that contains instructions for deploying the built container image.
4. The parent `devfile.yaml` [`deploy` command](https://github.com/devfile/registry/blob/main/stacks/go/2.2.0/devfile.yaml#L57-L64) completes the [outerloop](https://devfile.io/docs/2.2.0/innerloop-vs-outerloop) deployment phase by pointing to the `build` and `deploy` components to create your application.

### Additional resources

- For more information about Go, see [go.dev](https://go.dev/).
- For more information about devfiles, see [Devfile.io](https://devfile.io/).
- For more information about Dockerfiles, see [Dockerfile reference](https://docs.docker.com/engine/reference/builder/).
