using Documenter, GMT

makedocs(
    modules = [GMT],
    #format = :html,
    sitename = "GMT",
    assets = ["assets/custom.css"],
    pages = Any[
        "Introduction"             => "usage.md",
        "Some examples"            => "examples.md",
        "Draw rectangles examples" => "rectangles.md",
        "Draw frames examples"     => "frames.md",
        "Map projections"          => "proj_examples.md",
        "Gallery"                  => "gallery/tables.md",
        hide("gallery/scripts_agu/colored_bars.md"),
        hide("gallery/scripts_agu/bars_3D.md"),
        hide("gallery/scripts_agu/bars3_peaks.md"),
        "Manual" => [
            "monolitic.md",
            "modules.md",
            "Common options"       => "common_opts.md",
            "General features" => [
                "arrows_control.md",
                "color.md",
                "decorated.md",
                "symbols.md",
            ],
        ],
        "Modules manuals" => [
            "arrows.md",
            "bar.md",
            "bar3.md",
            "lines.md",
            "scatter.md",
            "scatter3.md",
            "solar.md",
        ],
        "The GMT types"            => "types.md",
        "Index"                    => "index.md",
    ],
    format = Documenter.HTML(prettyurls = true),
)

deploydocs(
    repo   = "github.com/GenericMappingTools/GMT.jl.git",
    target = "build",
    julia = "1.0.3",
    deps   = nothing,
    make   = nothing
)