examples
exampleTable7
	"Show a table with cell selection mode enabled, and different cell wodgets"
	<example>
	|table sampleDataSource|
	
	sampleDataSource :=FTCellSampleDataSource new:10.
	table := FTTableMorph new
		extent: 500@500;
		enableCellSelectionMode;
		addColumn: (FTColumn id: 'column1');    "editable FTLabelCellMorph"
		addColumn: (FTColumn id: 'column2');    "non editable FTLabelCellMorph"
		addColumn: (FTColumn id: 'column3');		"FTTextEditCellMorph"	
		addColumn: (FTColumn id: 'column4');    "FTCheckBoxCellMorph"
		addColumn: (FTColumn id: 'column5');	   "FTDropListCellMorph"
		addColumn: (FTColumn id: 'column6');	   "FTDateCellMorph"
		beResizableRows;
		dataSource: sampleDataSource;
		selectRowIndex: 1;
		mouseMoveSelection:true;
		showFirstRowSelection;	
		beMultipleSelection;
		onAnnouncement: FTSelectionChanged 
			do: [ :ann | ('rows selected: ', (ann newSelectedRowIndexes asString)) crLog ];
		onAnnouncement: FTCellStrongSelectionChanged 
			do: [ :ann | |index ep|
				index := ann selectedCellIndex.	
				ep := EditingProvider dateSource: sampleDataSource. ep addCellEditingEvents:index.
		];
	   allowDeselection;
		yourself.
		table openInWindow.