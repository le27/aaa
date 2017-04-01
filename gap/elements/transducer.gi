#############################################################################
##
#W  transducer.gi
#Y  Copyright (C) 2017                                 Fernando Flores Brito
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

InstallMethod(ViewObj, "for a transducer",
[IsTransducer],
function(T)
  Print("<Transducer with input alphabet on ", T!.InputAlphabet, " symbols, ",
        "output alphabet on ", T!.OutputAlphabet, " symbols, and ", T!.States,
        " states.>");
end);

InstallMethod(Transducer, "for two positive integers and two dense lists",
[IsPosInt, IsPosInt, IsDenseList, IsDenseList],
function(inalph, outalph, tranfunc, outfunc)
  local transducer, T;

  if IsEmpty(tranfunc) or IsEmpty(outfunc) then
    ErrorNoReturn("aaa: Transducer: usage,\n",
                  "the third and fourth arguments must be non-empty,");
  elif Size(tranfunc) <> Size(outfunc) then
    ErrorNoReturn("aaa: Transducer: usage,\n",
                  "the size of the third and fourth arguments must coincide,");
  elif ForAny(tranfunc, x -> not IsDenseList(x) or
              ForAny(x, y -> not y in [1 .. Size(tranfunc)])) then
    ErrorNoReturn("aaa: Transducer: usage,\n",
                  "the third argument contains invalid states,");
  elif ForAny(outfunc, x -> not IsDenseList(x) or
              ForAny(x, y -> not IsDenseList(y) or
                     ForAny(y, z -> not z in [0 .. outalph - 1]))) then
    ErrorNoReturn("aaa: Transducer: usage,\n",
                  "the fourth argument contains invalid output,");
  elif ForAny(tranfunc, x -> Size(x) <> inalph) or
       ForAny(outfunc, x -> Size(x) <> inalph) then
    ErrorNoReturn("aaa: Transducer: usage,\n",
                  "the size of the elements of the third or fourth argument ",
                  "does not coincide\nwith the first argument,");
  fi;

  transducer := function(input, state)
                  local ialph, oalph, tfunc, ofunc, output, n;
                  ialph := [0 .. inalph - 1];
                  oalph := [0 .. outalph - 1];
                  tfunc := tranfunc;
                  ofunc := outfunc;
                  output := [];

                  if not IsDenseList(input) then
                    ErrorNoReturn("aaa: Transducer: usage,\n",
                                  "the first argument must be a dense list,");
                  elif not IsPosInt(state) then
                    ErrorNoReturn("aaa: Transducer: usage,\n",
                                  "the second argument must be a positive ",
                                  "integer,");
                  elif state > Size(tfunc) then
                    ErrorNoReturn("aaa: Transducer: usage,\n",
                                  "the second argument must not be greater ",
                                  "than ", Size(tfunc), ",");
                  elif ForAny(input, x -> not x in ialph) then
                    ErrorNoReturn("aaa: Transducer: usage,\n",
                                  "the first argument must be a list of ",
                                  "integers in ", ialph, ",");
                  fi;

                  for n in input do
                    Append(output, ofunc[state][n + 1]);
                    state := tfunc[state][n + 1];
                  od;

                  return [output, state];
                end;

  T := Objectify(NewType(NewFamily("Transducer"), IsTransducer and
                 IsAttributeStoringRep), rec(InputAlphabet := inalph,
                                             OutputAlphabet := outalph,
                                             States := Size(tranfunc),
                                             TransitionFunction := tranfunc,
                                             OutputFunction := outfunc,
                                             TransducerFunction := transducer));

  return T;
end);
