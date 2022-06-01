Class {
	#name : #RunnerLongDurationTest,
	#superclass : #TestCase,
	#instVars : [
		'runner'
	],
	#category : #'Runner-Tests-Core'
}

{ #category : #tests }
RunnerLongDurationTest >> setUp [
	super setUp.
	runner := TestRunner2 new suitePreparator: ShuffleSuitePreparator.
]

{ #category : #tests }
RunnerLongDurationTest >> testRunningFromACollectionOfPackages [

	"first execution"

	| packages |
	packages := OrderedCollection
		            with: #'Zodiac-Tests' asPackage
		            with: #'Zodiac-Tests' asPackage.
	runner runPackages: packages.
	self assert: runner runCount equals: 79 * 2.
	self assert: runner passedCount equals: 79 * 2
]

{ #category : #tests }
RunnerLongDurationTest >> testRunningFromAPackage [

	"first execution"

	| aPackage |
	aPackage := #'Zodiac-Tests' asPackage.
	runner runPackage: aPackage.
	self assert: runner runCount equals: 79.
	self assert: runner passedCount equals: 79
]