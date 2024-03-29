﻿___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Page Path - Part N",
  "description": "Return the page path part by index, the last part, or the page path length (by Sublimetrix)",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "MACRO",
  "version": 1,
  "containerContexts": [
    "WEB"
  ],
  "brand": {
    "displayName": "Custom Template"
  }
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Documentation : https://github.com/sublimetrix/gtm-template-pagepath-partn",
    "name": "documentation",
    "type": "LABEL"
  },
  {
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Source",
    "defaultValue": "{{Page Path}}",
    "simpleValueType": true,
    "name": "path_source",
    "type": "TEXT"
  },
  {
    "macrosInSelect": false,
    "alwaysInSummary": true,
    "selectItems": [
      {
        "displayValue": "Part 1",
        "value": 1
      },
      {
        "displayValue": "Part 2",
        "value": 2
      },
      {
        "displayValue": "Part 3",
        "value": 3
      },
      {
        "displayValue": "Part 4",
        "value": 4
      },
      {
        "displayValue": "Part 5",
        "value": 5
      },
      {
        "displayValue": "Custom",
        "value": "custom"
      },
      {
        "displayValue": "Last part",
        "value": "last"
      },
      {
        "displayValue": "Path depth length (integer)",
        "value": "length"
      }
    ],
    "displayName": "Part of the path to return",
    "defaultValue": 1,
    "simpleValueType": true,
    "name": "path_part",
    "type": "SELECT",
    "subParams": [
      {
        "enablingConditions": [
          {
            "paramName": "path_part",
            "type": "EQUALS",
            "paramValue": "custom"
          }
        ],
        "valueValidators": [
          {
            "type": "POSITIVE_NUMBER"
          }
        ],
        "displayName": "Custom part index",
        "simpleValueType": true,
        "name": "custom_index",
        "type": "TEXT"
      }
    ]
  },
  {
    "alwaysInSummary": true,
    "simpleValueType": true,
    "name": "option_extension",
    "checkboxText": "Remove extension (.html, .php, .pdf, etc.)",
    "type": "CHECKBOX",
    "enablingConditions": [
      {
        "paramName": "path_part",
        "paramValue": "length",
        "type": "NOT_EQUALS"
      }
    ]
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
//log('data =', data);
let path = data.path_source;
const optExt = data.option_extension;

// resolve
if ('undefined' == typeof path) return path;
if (path.match('^http')) {
  path = path.split('/');
  path.shift();
  path.shift();
  path.shift();
  path = path.join('/');
}
if (0 <  path.indexOf('#')) {path = path.split('#')[0];}
if (0 <  path.indexOf('?')) {path = path.split('?')[0];}
if (0 == path.indexOf('#')) {path = path.replace('#', '');}
if (path.match('/$')) {path = path.slice(0, path.length-1);}
if (!path.match('^/')) {path = path = '/'+path;}


// script
const parts = path.split('/');
const lastIndex = parts.length-1;
const pathLength = '' == parts[1] ? 0 : lastIndex;

if ('length' == data.path_part ) {
  return pathLength;
} else {
  let index;
  switch( data.path_part ) {
    case 'last':
      index = lastIndex;
      break;
    case 'custom':
      index = data.custom_index;
      break;
    default:
      index = data.path_part;
      break;
  }
  let result = parts[index];
  if (true == optExt && 'undefined' != typeof result) {
    const match = result.match('^([^.]+)');
    if (match) {
      result = 'undefined' != typeof match[1] ? match[1] : result;
    }
  }
  return 'undefined' == typeof result ? '' : result;
}


___NOTES___

/*** SUBLIMETRIX ***/
Version: 1.0.0
Author: Sublimetrix
Date: 2019.10.10
/*******************/


Change Log:
1.0.0: Initial Version
1.1.0: Add custom source path (Click URL, ...)
1.1.1: Fix path resolve
1.1.2: Remove log requirement
1.2.0: Remove extension option
1.2.1: Fix
