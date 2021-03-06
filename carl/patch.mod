














                    Marketing Opportunities Document



                                  for



                 Software Updating and Patching Facility









Software Updating and Patching Facility                                Page  1

1.  Overview

    Repairing critical software problems between major software releases is
    a necessity because of the time delay between releases.  Some method of
    quick and easy repair is required with an appropriate measure of control.

    A facility is needed that provides a consistant user interface to replace,
    update, repair and patch an Osiris software subsystem.  The modularity of
    Osiris easily lends itself to module replacement.  Software updates must
    be made available to each system and must be easily applied.  Repair of
    broken, damaged and obsolete object modules must be available in order to
    prevent the loss of critical or sensitive data.  The ability to patch an
    existing object or subsystem is required to permit quick modification or
    repair to a damaged software subsystem.

2.  Requirements

    Required:  An object editor which allows the user to examine, modify and
        add to the contents of any object.

        Examination provides the primary source of information vital to the
        resolution of any problem with an object.  The ability to examine any
        block of data cast to ANY type, for example: integer, string, float,
        structure, etc.

        Both in-place and insert modification abilities must exist, with the
        ability to append additional data to the end of an object as just a
        subset of insertion mode.

    Required:  The ability to apply a software update to an object or grouping
        of objects.

        A software update may be in the form of a replacement object, an object
        patch, a correction script, an update process, etc.  Each form of
        update must be able to be applied using the update/patching facility.

    Required:  Update and patch level interdependency recognition.

        The patch facility must be able to recognize which updates and patches
        have been previously applied to an object and only apply new updates or
        patches where needed.  Each update or patch must also identify any
        dependancy on all previous updates and patches.

    Required:  Update and patch level tracking.

	Tracking of patches and updates previously installed (or removed) is
	required for the system administrator to effectivly track the hardware
	and software subsystems.  The patch facility must be able to interface
	effectively with a customer or vendor specified software update
        tracking facility.

    Required:  Update and patch removal ability.

	Entire patches and updates must be able to be removed from an object
	leaving the object in the pre-patched state.  This procedure must be
	able to be performed as easily as the installation of an update since
	the removal of previously installed patches may be regarded as a
	special type of update.

 