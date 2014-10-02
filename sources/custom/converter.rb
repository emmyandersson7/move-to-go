# encoding: UTF-8
require 'go_import'

# This Converter will convert a generic source to a XML file that can
# be imported into LIME Go.
#
# You MUST customzie this script to read a source and return a
# RootModel.
#
# Reference documentation for go_import can be found at
# https://rubygems.org/gems/go_import (click Documentation)
#
# Generate the xml-file that should be sent to LIME Go with the
# command:
# go-import run
#
# Good luck.

# If you are importing files then you must set the FILES_FOLDER
# constant. FILES_FOLDER should point to the folder where the files
# are stored. FILES_FOLDER can be relative to the project directory
# or absolute. Note that you need to escape \ with a \ so in order to
# write \ use \\.
FILES_FOLDER = "./files"

# If you are importing files with an absolute path (eg
# m:\documents\readme.doc) then you probably wont have files at that
# location on the computer where "go-import run" is executed. Set
# FILES_FOLDER_AT_CUSTOMER to the folder where documents are stored at
# the customers site. Ie, in this example m:\documents.
# Note that you need to escape \ with a \ so in order to write \ use
# \\.
FILES_FOLDER_AT_CUSTOMER = "m:\\documents\\"

class Converter
    def to_go()
        rootmodel = GoImport::RootModel.new

        # *** TODO:
        #
        # Configure the model and then add coworkers, organizations, etc

        return rootmodel
    end
end
