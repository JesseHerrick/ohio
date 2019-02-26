# OhioApp :us: :scroll: :newspaper:

<img width="200px" src="https://upload.wikimedia.org/wikipedia/commons/4/4c/Flag_of_Ohio.svg"></img>

[![Build Status](https://travis-ci.org/JesseHerrick/ohio.svg?branch=master)](https://travis-ci.org/JesseHerrick/ohio)

Ohio is a simple way of tracking the Ohio legislature as if it were a simple social media feed.

# Working with the Ohio General Assembly's Data

The Ohio General Assembly's backend is open, but not well-documented. The goal of this app is to make that data even more accessible. In general, the API looks like this:

http://search-prod.lis.state.oh.us/solarapi/v1/general_assembly_133/bills/hb16/IN/00?format=json

# Application Data Model Design

A general outline of how I intend to model the Ohio General Assembly's data in this application.

* **General Assembly**
    * Attributes:
        * Number: e.g. 133
        * API Slug: e.g. `/solarapi/v1/general_assembly_133`
    * **Chamber**
        * Attributes:
            * Name: House/Senate
            * Bills: Integer
            * API Slug: e.g. `/solarapi/v1/general_assembly_133/chamber/House`
        * Legislator(s)
            * Attributes:
                * Name: String
                * Website: String
                * API Slug: String
            * Vote(s)
                * LegislatorVote
                    * Attributes:
                        * Legislator ID: Integer
                        * Vote ID: Integer
            * Assignment(s)
                * Attributes:
                    * Committee ID: Integer
                    * Legislator ID: Integer
        * Committee(s)
            * Assignment(s)
                * Attributes: See above.
        * Bill(s)/Resolution(s)
            * Vote(s)
                * Attributes:
                    * Position: String (yea, nay, present)
                * LegislatorVote
                    * Attributes: See above.
