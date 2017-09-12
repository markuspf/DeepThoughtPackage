InstallMethod( ViewObj,
    "for a DTObj",
    [ IsDTObj ],
function(dt)
    Print("<DTObj>");
end);


InstallMethod( CollectWordOrFail,
    "for a DTObj, an exponent vector, and gen-exp-pair",
    [ IsDTObj, IsList, IsList ],
function(DTObj, expvec, genexp)
	local multiply, b1, res, i; 
	
	# CollectWordOrFail always returns normal forms, so the collector must
	# be confluent. 
	if not DTObj![PC_DTPConfluent] = true then 
		Error("Can not compute normal forms since the collector is not confluent. Use DTP_Multiply instead."); 
	fi; 
	
	# decide which polynomials were computed (either f_r or f_rs) for coll
	# in order to choose the correct multiplication function: 
	if IsInt(DTObj![PC_DTPPolynomials][1][1][1]) then 
		multiply := DTP_Multiply_r; 
	else
		multiply := DTP_Multiply_rs; 
	fi; 

	# since multiply expects exponent vectors, transform genexp:
	b1 := ExponentsByObj(DTObj, genexp); 
	
	res := multiply(expvec, b1, DTObj); 
	
	# the result of the multiplication is stored in a: 
	for i in [1 .. Length(expvec)] do 
		expvec[i] := res[i]; 
	od; 
	
	return true; 
end);

InstallMethod( IsConfluent,
        "for a DTObj",
        [ IsDTObj ],
function( DTObj )
	# when computing DTP_DTObjFromCollector, the functino IsConfluent for 
	# collector is called and the result is stored in the following variable:
	return DTObj![PC_DTPConfluent]; 
end );


# Step 2: Make it possible to use a DTObj to define a pcp group
#
# Try this to see what still needs to be done:
#  PcpGroupByCollector(dt);
#
# e.g. install method for UpdatePolycyclicCollector... --> recompute polynomials! compute isconfluent again 
#
#  this then needs a method for IsConfluent...

# ... and so on...

# alternatively, also look at the polycyclic source code to see
# what kind of methods you might need to implement...


coll_paper := FromTheLeftCollector(4);
SetConjugate(coll_paper, 2, 1, [2, 1, 3, 2]);
SetConjugate(coll_paper, 3, 1, [3, 1, 4, 1]);
SetConjugate(coll_paper, 3, 2, [3, 1, 4, 5]);
UpdatePolycyclicCollector(coll_paper);

Read("examples/ex_colls.g");
Read("examples/test.g"); 
