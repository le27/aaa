#############################################################################
##
#W  toperations.gd
#Y  Copyright (C) 2017                               Fernando Flores Brito
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

# This file contains the declaration of operations that relate to transducers.

DeclareOperation("InverseTransducer", [IsTransducer]);
DeclareOperation("TransducerProduct", [IsTransducerOrRTransducer,
                                       IsTransducerOrRTransducer]);
DeclareOperation("RemoveStatesWithIncompleteResponse", [IsTransducer]);
DeclareOperation("RemoveInaccessibleStates", [IsTransducer]);
DeclareOperation("CopyTransducerWithInitialState", [IsTransducer, IsPosInt]);
DeclareOperation("RemoveEquivalentStates", [IsTransducer]);
DeclareAttribute("IsInjectiveTransducer", IsTransducer);
DeclareAttribute("IsSurjectiveTransducer", IsTransducer);
DeclareAttribute("IsBijectiveTransducer", IsTransducer);
DeclareAttribute("TransducerImageAutomaton", IsTransducer);
DeclareAttribute("TransducerConstantStateOutputs", IsTransducer);
DeclareAttribute("IsDegenerateTransducer", IsTransducer);
DeclareAttribute("IsMinimalTransducer", IsTransducer);
DeclareAttribute("CombineEquivalentStates", IsTransducer);
DeclareAttribute("MinimalTransducer", IsTransducer);
DeclareAttribute("IsSynchronousTransducer", IsTransducer);
DeclareAttribute("IsSynchronizingTransducer", IsTransducer);
DeclareAttribute("IsBisynchronizingTransducer", IsTransducer);
DeclareAttribute("IsLipschitzTransducer", IsTransducer);
DeclareAttribute("TransducerOrder", IsTransducer);
DeclareAttribute("TransducerSynchronizingLength", IsTransducer);
DeclareAttribute("TransducerCore", IsTransducer);
DeclareAttribute("IsCoreTransducer", IsTransducer);
DeclareAttribute("ImageAsUnionOfCones", IsTransducer);
DeclareAttribute("HasClopenImage", IsTransducer);
DeclareAttribute("IsCompletableCore", IsTransducer);
DeclareAttribute("CoreCompletion", IsTransducer);
DeclareOperation("CoreProduct", [IsTransducer, IsTransducer]);
DeclareOperation("IsomorphicInitialTransducers", [IsTransducer, IsTransducer]);
DeclareOperation("OmegaEquivalentTransducers", [IsTransducer, IsTransducer]);
DeclareOperation("EqualTransducers", [IsTransducer, IsTransducer]);
DeclareOperation("IsomorphicTransducers", [IsTransducer, IsTransducer]);
DeclareOperation("\*", [IsTransducerOrRTransducer, IsTransducerOrRTransducer]);
DeclareOperation("\^", [IsTransducer, IsInt]);
DeclareOperation("\^", [IsTransducer, IsTransducer]);
