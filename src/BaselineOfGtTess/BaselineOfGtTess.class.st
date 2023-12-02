Class {
	#name : #BaselineOfGtTess,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtTess
}

{ #category : #loading }
BaselineOfGtTess class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-tess' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtTess >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtTess'
		]
]
