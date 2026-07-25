<#
Script      : Initialize-PowerShellNotes.ps1
Project     : IT Lab Utilities
Author      : Igors Prutskis
Version     : 1.0

Description :
Creates PowerShell Notes
#>

# ============================================================
# Script Starts Here
# ============================================================

# Store the folder path
$NotesFolder = "F:\IT_Lab\Documentation\PowerShell_Notes"

# Create the folder
New-Item -Path $NotesFolder -ItemType Directory -Force

# Store all note filenames
$NoteFiles = @(
    "README.md"
    "01_Basics.md"
    "02_Variables.md"
    "03_Conditions.md"
    "04_Loops.md"
    "05_Arrays.md"
    "06_Objects.md"
    "07_Files.md"
    "08_CSV.md"
    "09_Active_Directory.md"
    "10_Functions.md"
    "11_Common_Mistakes.md"
)

# Create each note file
foreach ($NoteFile in $NoteFiles)
{
	New-Item -Path "$NotesFolder\$NoteFile" -ItemType File -Force
}