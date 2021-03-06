@routing @bicycle @names
Feature: Bike - Street names in instructions

	Background:
		Given the speedprofile "bicycle"
	
	Scenario: Bike - A named street
		Given the node map
		 | a | b |
		 |   | c |
	
		And the ways
		 | nodes | name   |
		 | ab    | My Way |
		 | bc    | Your Way |
    
		When I route I should get
		 | from | to | route           |
		 | a    | c  | My Way,Your Way |
		
	Scenario: Bike - Use way type to describe unnamed ways
		Given the node map
		 | a | b | c |

		And the ways
		 | nodes | highway  | name |
		 | ab    | cycleway |      |
		 | bc    | track    |      |

		When I route I should get
		 | from | to | route          |
		 | a    | c  | cycleway,track |
	
	Scenario: Bike - Don't create instructions for every node of unnamed ways
		Given the node map
		 | a | b | c | d |

		And the ways
		 | nodes | highway  | name |
		 | abcd  | cycleway |      |

		When I route I should get
		 | from | to | route    |
		 | a    | d  | cycleway |