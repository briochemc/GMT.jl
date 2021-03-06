module GMT

using Printf

# Need to know what GMT version is available or if none at all to warn users on how to
# install GMT.
try
	#write("gmtversion__.txt", read(`gmt --version`))
	#global const GMTver = Meta.parse(read("gmtversion__.txt", String)[1:3])
	#rm("gmtversion__.txt")
	global const GMTver = Meta.parse(readlines(`gmt --version`)[1][1:3])
	global foundGMT = true
catch
	global foundGMT = false
	global const GMTver = 5.0
end

global legend_type  = nothing
global current_cpt  = nothing		# To store the current palette
const global img_mem_layout = [""]			# "TCP"	 For Images.jl. The default is "TRBa"
const global grd_mem_layout = [""]			# "BRP" is the default for GMT PS images.
const global current_view   = [""]			# To store the current viewpoint (-p)
const global multi_col   = Array{Bool,1}(undef,1)		# To allow plottig multiple columns at once (init to false)
const global IamModern   = Array{Bool,1}(undef,1)		# To know if we are in modern mode
const global FirstModern = Array{Bool,1}(undef,1)		# To know 
const global IamSubplot  = Array{Bool,1}(undef,1)		# To know if we are in subplot mode
const global usedConfPar = Array{Bool,1}(undef,1)		# Hacky solution for the session's memory trouble
const global convert_syntax = Array{Bool,1}(undef,1)	# To only convert to hard core GMT syntax (like Vd=2)
const global FMT = ["ps"]
const def_fig_size  = "12c/8c"              # Default fig size for plot like programs
const def_fig_axes  = " -Baf -BWSen"        # Default fig axes for plot like programs
const def_fig_axes3 = " -Baf -Bza -BWSenZ"  #		"" but for 3D views

export
	GMTver, FMT, gmt,
	arrows, arrows!, bar, bar!, bar3, bar3!, lines, lines!, legend, legend!,
	basemap, basemap!, blockmean, blockmedian, blockmode, clip, clip!, coast, coast!, colorbar, colorbar!,
	contour, contour!, events, filter1d, fitcircle, gmt2kml,  gmtconnect, gmtconvert, gmtinfo, gmtregress, 
	gmtread, gmtselect, gmtset, gmtsimplify, gmtspatial, gmtvector, gmtwrite, gmtwhich, 
	grd2cpt, grd2kml, grd2xyz, grdblend, grdclip, grdcontour, grdcontour!, grdcut, grdedit, grdfft,
	grdfilter, grdgradient, grdhisteq, grdimage, grdimage!, grdinfo, grdfill, grdlandmask, grdmask, grdpaste,
	grdproject, grdsample, grdtrack, grdtrend, grdvector, grdvector!, grdview, grdview!, grdvolume, greenspline,
	mat2ds, mat2grid, mat2img, histogram, histogram!, image, image!, imshow, kml2gmt, logo, logo!,
	makecpt, mask, mask!, mapproject, movie, nearneighbor, plot, plot!, plot3, plot3!, plot3d, plot3d!, project,
	pscontour, pscontour!, psconvert, psbasemap, psbasemap!, psclip, psclip!, pscoast, pscoast!, psevents,
	pshistogram, pshistogram!, psimage, psimage!, pslegend, pslegend!, psmask, psmask!, psrose, psrose!,
	psscale, psscale!, pssolar, pssolar!, psternary, psternary!, pstext, pstext!, pswiggle, pswiggle!,
	psxy, psxy!, psxyz, psxyz!, regress, rose, rose!, sample1d, scatter, scatter!, scatter3, scatter3!,
	solar, solar!, spectrum1d, sphdistance, sphinterpolate, sphtriangulate, surface, ternary, ternary!,
	text, text!, text_record, trend1d, trend2d, triangulate, splitxyz,
	decorated, vector_attrib, wiggle, wiggle!, xyz2grd,
	gmtbegin, gmtend, subplot, gmtfig, inset,
	linspace, logspace, contains, fields, tic, toc

include("common_docs.jl")
include("libgmt_h.jl")
include("libgmt.jl")
include("gmt_main.jl")
include("common_options.jl")
include("gmtbegin.jl")
include("blocks.jl")
include("filter1d.jl")
include("fitcircle.jl")
include("gmt2kml.jl")
include("gmtconnect.jl")
include("gmtconvert.jl")
include("gmtinfo.jl")
include("gmtlogo.jl")
include("gmtreadwrite.jl")
include("gmtset.jl")
include("gmtselect.jl")
include("gmtsimplify.jl")
include("gmtspatial.jl")
include("gmtregress.jl")
include("gmtvector.jl")
include("gmtwich.jl")
include("grd2cpt.jl")
include("grd2kml.jl")
include("grd2xyz.jl")
include("grdblend.jl")
include("grdclip.jl")
include("grdcut.jl")
include("grdedit.jl")
include("grdcontour.jl")
include("grdfft.jl")
include("grdfill.jl")
include("grdfilter.jl")
include("grdhisteq.jl")
include("grdinfo.jl")
include("grdimage.jl")
include("grdgradient.jl")
include("grdlandmask.jl")
include("grdmask.jl")
include("grdpaste.jl")
include("grdproject.jl")
include("grdsample.jl")
include("grdtrack.jl")
include("grdtrend.jl")
include("grdvector.jl")
include("grdview.jl")
include("grdvolume.jl")
include("greenspline.jl")
include("imshow.jl")
include("kml2gmt.jl")
include("makecpt.jl")
include("mapproject.jl")
include("movie.jl")
include("nearneighbor.jl")
include("plot.jl")
include("project.jl")
include("psbasemap.jl")
include("psclip.jl")
include("pscoast.jl")
include("pscontour.jl")
include("psconvert.jl")
include("pshistogram.jl")
include("psimage.jl")
include("pslegend.jl")
include("psmask.jl")
include("psscale.jl")
include("psrose.jl")
include("pssolar.jl")
include("pstext.jl")
include("psxy.jl")
include("pswiggle.jl")
include("sample1d.jl")
include("spectrum1d.jl")
include("sphdistance.jl")
include("sphinterpolate.jl")
include("sphtriangulate.jl")
include("splitxyz.jl")
include("surface.jl")
include("subplot.jl")
include("triangulate.jl")
include("trend1d.jl")
include("trend2d.jl")
include("xyz2grd.jl")

if (!foundGMT)
	println("\n\nYou don't seem to have GMT installed and I don't currently install it automatically,")
	println("so you will have to do it yourself. Please follow instructions bellow but please note")
	println("that since GMT is migrating to Github (https://github.com/GenericMappingTools/gmt),")
	println("some of the links may change in a near future.\n\n")
	if (Sys.iswindows() && Sys.WORD_SIZE == 64)
		println("1) Download and install the official version at (the '..._win64.exe':")
		println("\t\t https://github.com/GenericMappingTools/gmt/releases")
	elseif (Sys.iswindows() && Sys.WORD_SIZE == 32)
		println("Download and install the official version at (the '..._win32.exe':")
		println("\t\t https://github.com/GenericMappingTools/gmt/releases")
	else
		println("https://github.com/GenericMappingTools/gmt/blob/master/INSTALL.md")
	end
end

function __init__()
	try
		ver = Meta.parse(readlines(`gmt --version`)[1][1:3])
		if (ver != GMTver && abs(ver - GMTver) > 0.5)	# Warn only when detecting a GMT5 vs GMT6 change
			t = joinpath(homedir(), ".julia", "compiled", "v1.xxx", "GMT")
			println("\n\tYou seem to have changed your installed GMT version. Current version")
			println("\treports to be $ver but previously it was $GMTver. To fix this you need to")
			println("\tmake sure that GMT.jl recompiles again, otherwise fatal errors may occur.")
			println("\tPlease delete the contents of the\n\n\t\t$t\n\n\tdirectory and start a new Julia session.")
		end
		if (GMTver >= 6)
			run(`gmt clear sessions`)	# Clear eventual trash let behind
		end
	catch
	end
	try
		FMT[1] = ENV["JULIA_GMT_IMGFMT"]
	catch
	end
end

include("precompile_GMT_i.jl")
_precompile_()

end # module
