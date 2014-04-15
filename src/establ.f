      subroutine establ(es,tp)
c
c     This routine calculates the saturation vapour pressure (over
c     water or ice, whichever is applicable) for a given temperature.
c     The routine linearly interpolates between tabulated values,
c     These had been calculated from the Goff-Gratch formulae, given
c     in Smithsonian Meteorological Tables (p. 350, 6 th. revised edition)
c     The units are Pascal (mks)
c     Note that the input temperature is modified (if necessary) to lie
c     within the range of the data statement
c
      dimension table(100:373)
      data (table(i),i=100,159) /
     1 1.077628e-14 , 1.953028e-14 , 3.499257e-14 , 6.200219e-14 ,
     2 1.086787e-13 , 1.885038e-13 , 3.236400e-13 , 5.501624e-13 ,
     3 9.262519e-13 , 1.544854e-12 , 2.553159e-12 , 4.182217e-12 ,
     4 6.791645e-12 , 1.093662e-11 , 1.746722e-11 , 2.767509e-11 ,
     5 4.350826e-11 , 6.788185e-11 , 1.051284e-10 , 1.616406e-10 ,
     6 2.467861e-10 , 3.742017e-10 , 5.636122e-10 , 8.433655e-10 ,
     7 1.253938e-09 , 1.852802e-09 , 2.721066e-09 , 3.972508e-09 ,
     8 5.765938e-09 , 8.321658e-09 , 1.194375e-08 , 1.704982e-08 ,
     9 2.421007e-08 , 3.419955e-08 , 4.806717e-08 , 6.722367e-08 ,
     t 9.356042e-08 , 1.295989e-07 , 1.786883e-07 , 2.452545e-07 ,
     1 3.351255e-07 , 4.559402e-07 , 6.176737e-07 , 8.332885e-07 ,
     2 1.119581e-06 , 1.498230e-06 , 1.997084e-06 , 2.651822e-06 ,
     3 3.507977e-06 , 4.623439e-06 , 6.071568e-06 , 7.945028e-06 ,
     4 1.036044e-05 , 1.346415e-05 , 1.743916e-05 , 2.251371e-05 ,
     5 2.897130e-05 , 3.716345e-05 , 4.752465e-05 , 6.058962e-05 /
      data (table(i),i=160,219) /
     6 7.701574e-05 , 9.760849e-05 , 1.233514e-04 , 1.554437e-04 ,
     7 1.953419e-04 , 2.448133e-04 , 3.059920e-04 , 3.814546e-04 ,
     8 4.742994e-04 , 5.882471e-04 , 7.277494e-04 , 8.981318e-04 ,
     9 1.105734e-03 , 1.358101e-03 , 1.664186e-03 , 2.034594e-03 ,
     t 2.481849e-03 , 3.020718e-03 , 3.668596e-03 , 4.445905e-03 ,
     1 5.376566e-03 , 6.488592e-03 , 7.814649e-03 , 9.392871e-03 ,
     2 1.126754e-02 , 1.349013e-02 , 1.612031e-02 , 1.922708e-02 ,
     3 2.289019e-02 , 2.720151e-02 , 3.226698e-02 , 3.820806e-02 ,
     4 4.516426e-02 , 5.329573e-02 , 6.278510e-02 , 7.384116e-02 ,
     5 8.670198e-02 , 1.016391e-01 , 1.189600e-01 , 1.390149e-01 ,
     6 1.622007e-01 , 1.889662e-01 , 2.198184e-01 , 2.553317e-01 ,
     7 2.961504e-01 , 3.430030e-01 , 3.967071e-01 , 4.581796e-01 ,
     8 5.284528e-01 , 6.086793e-01 , 7.001483e-01 , 8.043054e-01 ,
     9 9.227576e-01 , 1.057298e+00 , 1.209929e+00 , 1.382869e+00 ,
     t 1.578587e+00 , 1.799823e+00 , 2.049607e+00 , 2.331310e+00 /
      data (table(i),i=220,279) /
     1 2.648648e+00 , 3.005731e+00 , 3.407078e+00 , 3.857707e+00 ,
     2 4.363125e+00 , 4.929384e+00 , 5.563153e+00 , 6.271735e+00 ,
     3 7.063177e+00 , 7.946265e+00 , 8.930630e+00 , 1.002684e+01 ,
     4 1.124641e+01 , 1.260192e+01 , 1.410713e+01 , 1.577698e+01 ,
     5 1.762780e+01 , 1.967734e+01 , 2.194490e+01 , 2.445148e+01 ,
     6 2.721980e+01 , 3.027464e+01 , 3.364268e+01 , 3.735300e+01 ,
     7 4.143688e+01 , 4.592852e+01 , 5.086420e+01 , 5.628382e+01 ,
     8 6.222984e+01 , 6.874854e+01 , 7.588937e+01 , 8.370591e+01 ,
     9 9.225546e+01 , 1.016000e+02 , 1.118054e+02 , 1.229435e+02 ,
     t 1.350906e+02 , 1.483282e+02 , 1.627449e+02 , 1.784337e+02 ,
     1 1.954962e+02 , 2.140394e+02 , 2.341790e+02 , 2.560363e+02 ,
     2 2.797440e+02 , 3.054405e+02 , 3.332757e+02 , 3.634087e+02 ,
     3 3.960078e+02 , 4.312536e+02 , 4.693362e+02 , 5.104613e+02 ,
     4 5.548427e+02 , 6.027103e+02 , 6.490833e+02 , 6.974472e+02 ,
     5 7.489759e+02 , 8.038442e+02 , 8.622381e+02 , 9.243496e+02 /
      data (table(i),i=280,339) /
     6 9.903801e+02 , 1.060540e+03 , 1.135048e+03 , 1.214133e+03 ,
     7 1.298034e+03 , 1.386995e+03 , 1.481280e+03 , 1.581153e+03 ,
     8 1.686894e+03 , 1.798796e+03 , 1.917160e+03 , 2.042302e+03 ,
     9 2.174548e+03 , 2.314229e+03 , 2.461705e+03 , 2.617333e+03 ,
     t 2.781498e+03 , 2.954585e+03 , 3.137000e+03 , 3.329167e+03 ,
     1 3.531512e+03 , 3.744493e+03 , 3.968563e+03 , 4.204218e+03 ,
     2 4.451946e+03 , 4.712250e+03 , 4.985678e+03 , 5.272767e+03 ,
     3 5.574079e+03 , 5.890203e+03 , 6.221732e+03 , 6.569279e+03 ,
     4 6.933505e+03 , 7.315039e+03 , 7.714571e+03 , 8.132799e+03 ,
     5 8.570438e+03 , 9.028211e+03 , 9.506881e+03 , 1.000725e+04 ,
     6 1.053009e+04 , 1.107625e+04 , 1.164655e+04 , 1.224186e+04 ,
     7 1.286311e+04 , 1.351115e+04 , 1.418697e+04 , 1.489152e+04 ,
     8 1.562576e+04 , 1.639074e+04 , 1.718746e+04 , 1.801699e+04 ,
     9 1.888046e+04 , 1.977893e+04 , 2.071354e+04 , 2.168553e+04 ,
     t 2.269599e+04 , 2.374621e+04 , 2.483740e+04 , 2.597085e+04 /
      data (table(i),i=340,373) /
     1 2.714790e+04 , 2.836981e+04 , 2.963805e+04 , 3.095386e+04 ,
     2 3.231878e+04 , 3.373422e+04 , 3.520164e+04 , 3.672263e+04 ,
     3 3.829861e+04 , 3.993125e+04 , 4.162210e+04 , 4.337276e+04 ,
     4 4.518500e+04 , 4.706042e+04 , 4.900080e+04 , 5.100791e+04 ,
     5 5.308350e+04 , 5.522940e+04 , 5.744753e+04 , 5.973969e+04 ,
     6 6.210786e+04 , 6.455393e+04 , 6.708005e+04 , 6.968800e+04 ,
     7 7.238013e+04 , 7.515831e+04 , 7.802475e+04 , 8.098157e+04 ,
     8 8.403112e+04 , 8.717544e+04 , 9.041697e+04 , 9.375788e+04 ,
     9 9.720045e+04 , 1.007473e+05                               /
      if(tp.gt.332.0) tp=332.0
      if(tp.lt.100.0) tp=100.0
      itp=tp
      es=table(itp)+(tp-itp)*(table(itp+1)-table(itp))
      return
      end