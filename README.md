# Description

### A notice
If you are unsure, please refer to the description on the last commit on the
[`master`](https://github.com/paveloom-d/binder-julia-plots/tree/master) branch.

### What is this?

This is a Docker image from
[the series of images](https://github.com/orgs/paveloom-d/projects/1) based on the
[`paveloom/binder-base`](https://github.com/paveloom-d/binder-base) image. This one combines
[`paveloom/binder-julia`](https://github.com/paveloom-d/binder-julia) and
[`paveloom/binder-tex`](https://github.com/paveloom-d/binder-tex), and adds a couple of
Julia packages. The task of this image is to allow TeX to be used when creating labels on
plots. See more details about the content of the image under the spoiler.

<details>
<summary>Content of the image</summary>
<ul>
  <li>
    Base image:
    <a href="https://github.com/paveloom-d/binder-tex">paveloom/binder-tex</a>
    (0.1.1)
  </li>
  <li>
    Julia environment
    from <a href=https://github.com/paveloom-d/binder-julia>paveloom/binder-julia</a>
    (0.1.1)
    <ul>
      <li>Packages</li>
      <ul>
        <li><a href="https://github.com/JuliaLang/IJulia.jl">IJulia.jl</a></li>
        <li><a href="https://github.com/JuliaPy/PyPlot.jl">PyPlot.jl</a></li>
        <li><a href="https://github.com/JuliaPlots/Plots.jl">Plots.jl</a></li>
      <ul>
    </ul>
  </li>
</ul>
</details>

### Any examples?

Yeah, there's a Jupyter notebook you can watch static
[here on GitHub](https://github.com/paveloom-d/binder-julia-plots/blob/master/examples/example.ipynb)
or interactively on
[Binder](https://mybinder.org/v2/gh/paveloom-d/binder-julia-plots/master?urlpath=lab/tree/example.ipynb).

### How do I use it?

The image is hosted on [Docker Hub](https://hub.docker.com/r/paveloom/binder-julia-plots).
To get it, in your `Dockerfile` just specify:

```dockerfile
FROM paveloom/binder-julia-plots:tag
```

where the `tag` is one of the following:

* [0.1.1](https://github.com/paveloom-d/binder-julia-plots/releases/tag/v0.1.1)
* [0.1.0](https://github.com/paveloom-d/binder-julia-plots/releases/tag/v0.1.0)
