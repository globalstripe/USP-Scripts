# USP-Scripts
  
Script to create an alternate live server isml for Unified Streaming.

Note: The original Server Side Manifest needs to be created with the --database_path value set.

http://docs.unified-streaming.com/documentation/live/streaming.html

This script will create a duplicate .isml file, removing specified entries that are not required and sync the two isml Manifests

Allowing playout requests to be responded to with different server side configurations
