Extension { #name : #AbstractFont }

{ #category : #'*PTerm-UI' }
AbstractFont >> isMonospace [
	^ (self widthOf: $M) = (self widthOf: $i)
]
