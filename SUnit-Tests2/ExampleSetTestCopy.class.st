Class {
	#name : #ExampleSetTestCopy,
	#superclass : #TestCaseCopy,
	#instVars : [
		'full',
		'empty'
	],
	#category : #'SUnit-Tests2'
}

{ #category : #running }
ExampleSetTestCopy >> setUp [
	super setUp.
	empty := Set new.
	full := Set with: 5 with: #abc
]

{ #category : #testing }
ExampleSetTestCopy >> testAdd [
	empty add: 5.
	self assert: (empty includes: 5)
]

{ #category : #testing }
ExampleSetTestCopy >> testGrow [
	empty addAll: (1 to: 100).
	self assert: empty size equals: 100
]

{ #category : #testing }
ExampleSetTestCopy >> testIllegal [
	self 
		should: [empty at: 5] 
		raise: self defaultTestError.
	self 
		should: [empty at: 5 put: #abc] 
		raise: self defaultTestError
]

{ #category : #testing }
ExampleSetTestCopy >> testIncludes [
	self assert: (full includes: 5).
	self assert: (full includes: #abc)
]

{ #category : #testing }
ExampleSetTestCopy >> testOccurrences [
	self assert: (empty occurrencesOf: 0) equals: 0.
	self assert: (full occurrencesOf: 5) equals: 1.
	full add: 5.
	self assert: (full occurrencesOf: 5) equals: 1
]

{ #category : #testing }
ExampleSetTestCopy >> testRemove [
	full remove: 5.
	self assert: (full includes: #abc).
	self deny: (full includes: 5)
]