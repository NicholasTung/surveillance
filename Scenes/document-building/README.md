# Random notes about building documents

## Plan
Create reusable classes to construct different types of documents

### Summary
The summary document will be the first document that is presented to players.

#### First attempt: `RichTextLabel` formatted with bbcode
While RichTextLabel proves promising for the pure text parts of documents, with its ability to specify fonts and build text with formatting tags, it has little flexibility for formatting the document as a whole (images, margins, etc.)

#### Second attempt (current): Composing overall documents with instances of smaller pieces
This second attempt will split a document into multiple parts. Components of a document can be linked together via containers

- Summary
  - scrollable set of document components using VBoxContainer
    - Set gaps of VBoxContainer to 0

- SummaryHeader
  - HBoxContainer that contains SummaryPhoto and SummaryOverview side-by-side
  - could extend to include more information that is on all summary docus

- SummaryOverview
  - defines the informational part of a suspect's summary (name, age, birthday, etc.)
  - RichTextLabel
    - RTL should have a StyleBox `normal` to set background color and maybe margins (StyleBoxFlat?)

- SummaryPhoto
  - defines the headshot that is displayed at the top of a summary report

- SummaryConfidence
  - tentative for now, but something to display the AI's confidence in if the person should be arrested or not

- SummarySection
  - Generic object that defines a section of the summary report
    - examples of a section include "Background", "Crime details" or anything else that deserves its own section of one or more paragraphs of text

- Surveillance UI
  - maybe can manage documents using a tabbed container
  - also should have the buttons to control the game (arrest or ignore)

