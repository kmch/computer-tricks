# SEGY VS. SU FORMAT
# SEGY:
# - ASCII HEADER (WHERE IS IT? SEPARATE FILE???)
# - BINARY HEADER
# - 1ST TRACE HEADER
# - 1ST TRACE
# - 2ND TRACE HEADER
# - 2ND TRACE
# - ...
# SU:
# - 1ST TRACE HEADER
# - 1ST TRACE
# - 2ND TRACE HEADER
# - 2ND TRACE
# - ...

#
suhelp
##

# PROPERLY SCALE AMPLITUDE-AXIS
suxwigb f2=0 x2beg=-{a} x2end={a}
# WHERE 
# f2 - value of the axis that corresponds to the zero amplitude of the data
# x2* - limits of the axis
##


icount=4 # => deg deg min min sec sec
##

# SAVE PLOT TO FILE
supsimage > image.ps
##


# FREQUENCY SPECTRUM
segyread tape=p17-RawSign.sgy | suspecfx | suxwigb
##

# VIEW NON-ZERO HEADER FIELDS (RANGES)
surange < file.su
segyread tape=MGL1521_S181_4_profile17.sgy | surange

# CREATE SOURCE WAVELET
suwaveform type=ricker dt=0.001 ns=4000 fpeak=20 | segyhdrs | segywrite tape=testsurf2-RawSign.sgy

# CONVERT .bin TO .su (ADD TRACE HEADERS)
suaddhead < data.bin ns=1024 > data.su # ns - NO. OF SAMPLES

# 2. If your data are Fortran-style floats, then you would use
suaddhead < datafile ftn=1 ns=NS > data.su #!!!!!!!!!!!!!!!!!!!!!!


# PLOT ONLY 1 SHOT GATHER
suaddhead < *-Observed-Time.bin ns=3000 | surange # ns OR SOMETHING ELSE?
suaddhead < *-Observed-Time.bin ns=3000 | suwind key=tracl min=1 max=187 | suximage perc=99
# 1-187 RECEIVERS


# DISPLAYING MODEL (X/Z = 1000, BECAUSE SU CAN'T HANDLE dt>100,000 [MICRO sec]!)
segyread tape=p17-TrueVp.sgy | sushw key=dt a=1000 | suximage


suaddhead < p17-StartVp_chckr.bin ftn=1 ns=201 | sushw key=dt a=1000 | segyhdrs | segywrite tape=p17-TrueVp_chckr.sgy


# receiver and source grids are in grid nodes units (from top-left)

# CHANGE COLOR-PALETTE IN SU 
r
# REVERSE DIRECTION
shift+r
##

# Butterworth FILTER (VALUES FROM PAN INTERNSHIP WITH MMALIN)
segyread tape=MGL1521_181S_4_profile17.sgy | subfilt fstoplo=3 fpasslo=4 fpasshi=30 fstophi=40 | suximage perc=99
##

# ZERO-PHASE SINC FILTER (HERE HIGH-PASS 0,0,1,1)
segyread tape=MGL1521_181S_4_profile17.sgy | sufilter f=3,4,30,40 amps=0,0,1,1 | suxwigb

#
segyread tape=MGL1521_W190_4.segy | suwind tmin=0 tmax=30 key=fldr min=46119 max=46337 | suximage
##

# PLOT .sgy MODELS
segyread tape=*.sgy | suximage legend=1
##



# PLOT ALL SHOT GATHERS
ximage < *-Observed-Time.bin n1=3000 n2=100 perc=99
# n1 - REQUIRED NO. OF SAMPLES IN 1ST, 'FAST', DIMENSION (I.E. TIME!)
# n2 - NOT REQUIRED (IN THEORY) NO. OF RECEIVERS - NECESSARY FOR PROPER CHUNKING THOUGH
# perc - GAIN (IN % OF HIGHEST AMPLITUDE => THE SMALLER, THE SHARPER DETAILS)
##
