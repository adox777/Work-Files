
-- TagText V65 by adrian.holgate@wsu.edu
-- Last updated on 8/30/2017

--[[
UpdateLogs
 V69
 * UNSTABLE Version
 * Finding a way to fix spacing bug
 V68
 * UNSTABLE Version
 * fixing spacing issues
 V67
 * optional _target of a tag ADDED
 * Reworking random number function
 * NUMS in URL FIXED
 * HTTPS working with isS
 V65-66
 * UNSTABLE Version (fixing number issues)
 * NUMS in URL is broken, needs fix.
 * isS option now implemented
 ** isS ex: [my word;<isS>google.com]
 ** isS will use HTTPS rather HTTP
 ** if website has no HTTPS then do NOT add isS
 * links now link externally
 ** WWW
 * Fixing $$ label $$ spacing (2 carraige returns extra)
 * Case sensitive option (in PROGRESS)
 * Fixing extra space with HTML tags
 V59-64
 * Improved FINAL NOTES section
 * The following: ,;:?!{}[]()  will now work with Program
 * Do not repeat search for toChange section if there are duplicates
 V56-58
 * Output seportators functional
 ** $$<label> <here>$$
 ** Space and two word label is currently MANDATORY
 V54-55
 * VERY UNSTABLE Version - lots of new features being implemented + bugs being worked out
 * WANT to add customizable "codes"
 ** such as seperating output text
 ** MAYBE the ,*<number> and ,*00<number>
 * Reworking the "main code" function
 * Seperate output text with $$<label name>$$
 V53
 * Some delay time/function available so virtual interpreter doesn't crash
 * Check toChange for duplicates
 V52
 * UNSTABLE Version
 * Elapsed time
 V51
 *! Deatails of this version are under UpdateLogs
 * Program IS functional but WITH few Bugs
 * Case sense UNSTABLE
 * Reorganization of code (more understandable)
 V50
 * UNSTABLE Version
 * New case sensitive option (WIP)
 * (WIP) This <*>,* added for optional case sensitive feature (otherwise NOT case sensitive)
 * (WIP) Capital letters addressed
 V48-49
 * More information on text given
 ** different words
 ** words total
 ** different repeated words
 * The ,*00<number> now FULLY functional
 V47
 * Help function being implemented
 * The ,*00<number> now SEMI functional
 V46
 * Mostly-stable Version
 * The ,*00<number> not yet functional
 * Most everything working
 V44-45
 * UNSTABLE Version
 * Working on new toChange modifiers
 V43
 * UNSTABLE Version
 V41-42
 * Fixed all known errors
 * Finished Example Inputs and Outputs
 * Made amount_of_links work with new updates of V41
 * Allow numbers in URL names
 * Allow collons, foward slashes in URL names
 V40
 * Fixed spacing conflict
 * Program will now know if user wants to change amount_of_links
 * User now has option to add ,*<number> to decide how many occurrences of the link they would like added to their text (number MUST be positive).
 ** ,*00 would link unlimited times
 ** ,*0 would NOT link the hyperlink at all
 ** ,*<number> would link how ever many times <number> was
 V1-39
 * Basic program created
]]
--[[

TagText V51
====================================
Working capabilites include
# Hyperlinking working for multiple phrases and links with "codes" (,*<number> formating)
## ,*00         - link ALL occurrences of this phrase
## ,*0          - do NOT link this phrase
## ,*<number>   - how many times will phrase be linked
## ,*00<number> - out of 10, hyperlink will occur <number> times
# Information regarding the text put in the textToRead section
## Number of characters inputed
## Number of unique words
## Number of words in total
## Number of different repeated words
====================================
--> ISSUES <--
The caps of the letters needs to be addresed.
Portion of text is being cut off when using ,*00<number>

]]

--------  START OF INSTRUCTIONS  ---------------------------------------------------
--[[
Usage (for one word to change)           ->  toChange = "[<phrase>;<URL>]"
Usage (for one or more words to change)  ->  toChange = "[<phrase>;<URL>],[<phrase>;<URL>],[<phrase>;<URL>]"
* If you are using amount_of_links
Usage (for one word to change)           ->  toChange = "[<phrase>;<URL>],*<number>"
Usage (for one or more words to change)  ->  toChange = "[<phrase>;<URL>],*<number>[<phrase>;<URL>],*<number>[<phrase>;<URL>],*<number>"
*
ExampleA                -->    toChange = "[FFTF;http://www.hanford.gov/page.cfm/400areafftf]"
ExampleB                -->    toChange = "[FFTF;http://www.hanford.gov/page.cfm/400areafftf],[lua;http://lua-users.org/]"
ExampleC                -->    toChange = "[search;www.google.com],*1[bad;www.bing.com],*0[cool school;www.wsu.edu],*00"

ExampleA Explanation    -->    Finds all instances of the word "FFTF" and hyperlinks to http://www.hanford.gov/page.cfm/400areafftf.
ExampleB Explanation    -->    Finds all instances of the word "FFTF" and hyperlinks to http://www.hanford.gov/page.cfm/400areafftf. Finds all
instances of the word lua and hyperlinks to http://lua-users.org/.
ExampleC Explanation    -->    Finds the first 2 instances of the word "search" and hyperlinks it to www.google.com. Finds every instance of the word
"bad" and hyperlinks it to www.bing.com. Finds every instance of the phrase "cool school" and hyperlinks to www.wsu.edu.


ExampleA INPUT
textToRead = {"I think that FFTF is quite intresting. I hope to study FFTF more in the future."}
toChange = "[FFTF;http://www.hanford.gov/page.cfm/400areafftf]"
ExampleA OUTPUT
I think that<a href="http://www.hanford.gov/page.cfm/400areafftf"> FFTF</a> is quite intresting. I hope to study<a href="http://www.hanford.gov/page.cfm/400areafftf"> FFTF</a> more in the future.

ExampleB INPUT
textToRead = {"<p>Here I have some text in some paragraph tags, the hyperlinks will still work!!!</p>"}
toChange = "[here;maps.google.com],[paragraph;https://en.wikipedia.org/wiki/Paragraph]"
ExampleB OUTPUT
<p>Here I have some text in some<a href="https://en.wikipedia.org/wiki/Paragraph"> paragraph</a> tags, the hyperlinks will still work!!!</p>

ExampleC INPUT
textToRead = {"I only use the best search browsers. I do not like bad search browsers. The bad ones are not nice to work with at all. I do enjoy going to this super fun and cool school though. If you are in search of a cool school I would suggest wsu tri-cities."}
toChange = "[search;www.google.com],*1[bad;www.bing.com],*0[cool school;www.wsu.edu],*00"
ExampleC OUTPUT
I only use the best<a href="www.google.com"> search</a> browsers. I do not like bad search browsers. The bad ones are not nice to work with at all. I do enjoy going to this super fun and<a href="www.wsu.edu"> coolschool</a> though. If you are in search of a<a href="www.wsu.edu"> coolschool</a> I would suggest wsu tri-cities.

]]--
--------  END OF INSTRUCTIONS  ---------------------------------------------------



-- ************************************************************************************* --

--[[
<span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Okay</span><span class=DQMTextRun SCX45489217DQM>.&nbsp;</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Yeah, let's have you talk about your family and how your family came to White Bluffs.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;First?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Yeah.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Okay</span><span class=DQMTextRun SCX45489217DQM>.</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM><span class=DQMTextRun SCX45489217DQM>Reid</span></span><span class=DQMTextRun SCX45489217DQM>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;I came here in</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>June to White Bluffs, Washington in 1935 or '36. I'm pretty sure it was '36 because I had my sixth birthday there.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So you said you were born in North Dakota and moved to White Bluffs in 1936. Why did your family leave</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>North Dakota and head to White Bluffs?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Well, we had a terrible Depression, as you know. And I was a Depression baby, and we just simply weren't</span><span class=DQMTextRun SCX45489217DQM>&mdash;</span><span class=DQMTextRun SCX45489217DQM>there</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was no work, there was no money. We just simply had to get out of there. We lost a little boy at two and a half with</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>what they call membranous croup at the time. But it was actuall</span><span class=DQMTextRun SCX45489217DQM>y, what it was&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>was</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;that awful--</span><span class=DQMTextRun SCX45489217DQM>oh, kids have it. It's</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>asthma, terrible asthma. And he just couldn't make it. And I think it just broke my mother's heart. She had just lost</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>a baby. So then I became the baby. But I think I was almost six, so--She had written all over Washington, Oregon, because she knew that there was fruit there. And there was food,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and the temperature was reasonable. And so she wrote all the little towns that she could find in Washington and</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oregon to find out what they did there, what they grew, and what the chances were of people surviving. And she</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>got one for Mr.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Reierson</span><span class=DQMTextRun SCX45489217DQM>&nbsp;that owned the grocery store in White Bluffs, and one from the man who had the</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>bank. And I can't remember his name. But she got glowing letters about the fruit. She got glowing things about</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>that there was work. There was packing sheds, there were alfalfa fields to take car</span><span class=DQMTextRun SCX45489217DQM>e of. And there certainly were.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>They didn't stint on it and it was not exaggerated.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So that's how we came to be there, and find it we did. It was exactly like they described it. It was probably the best</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>thing that ever happened to us, because we would have starved. We had no money even to pay for that little boy's</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>doctor bill that we left. So then I was the littlest one, and we had six left.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And so talk a little bit about your parents and your siblings, what your parents' names and your siblings' names--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Well, my oldest sister--</span><span class=DQMTextRun SCX45489217DQM>who I dearly love an</span><span class=DQMTextRun SCX45489217DQM>d still is alive and I'm glad--</span><span class=DQMTextRun SCX45489217DQM>is 10 ye</span><span class=DQMTextRun SCX45489217DQM>ars older than me. And her name&nbsp;</span><span class=DQMTextRun SCX45489217DQM>is Dorothy Lo</span><span class=DQMTextRun SCX45489217DQM><span class=DQMNormalTextRun SCX45489217DQM>rraine&nbsp;</span><span class=DQMSpellingError SCX45489217DQM>Boehmer</span><span class=DQMNormalTextRun SCX45489217DQM>-- DQMbay-</span></span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>mer</span></span><span class=DQMTextRun SCX45489217DQM>DQM--Foyer.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;And she lives in Everett</span><span class=DQMTextRun SCX45489217DQM>, Washington, and she will also&nbsp;</span><span class=DQMTextRun SCX45489217DQM>probably make a statement to you. But she's my oldest. And then I had a sister&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>LaVonne</span></span><span class=DQMTextRun SCX45489217DQM>. I had a sister na</span><span class=DQMTextRun SCX45489217DQM>med&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Helen and a brother named Virgil, all of them the same name, Boehm</span><span class=DQMTextRun SCX45489217DQM>er. And I had a little brother.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I had a sister named Darlene also. And she didn't live at White Bluffs. She stayed&nbsp;</span><span class=DQMTextRun SCX45489217DQM>with my great-aunt and uncle in&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Minnesota because they had no children and they wanted to educate her. She was very smart. And she had been</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>treated badly at school in North Dakota, and she didn't want to go back. And they were visiting us. So my mother</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>said, well, you could have her&nbsp;</span><span class=DQMTextRun SCX45489217DQM>for a year. And of course she--</span><span class=DQMTextRun SCX45489217DQM>they became so attached to her. And she loved</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>them dearly, and they were good to her. And they did visit us at White Bluffs. And they liked White Bluffs when</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they came. But it was the best thing that ever happened t</span><span class=DQMTextRun SCX45489217DQM>o us to move to White Bluffs. They</span><span class=DQMTextRun SCX45489217DQM>&nbsp;had work in packing</span><span class=DQMTextRun SCX45489217DQM>&nbsp;sheds, like I say. They had--</span><span class=DQMTextRun SCX45489217DQM>the kids were very receptive to us. And everybody there just opened their arms.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I wonder if you could describe the place you lived in White Bluffs.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Well, we lived at&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Lulubelle</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;Johnson's house, and we were buying it from her. But we never realized any money out</span><span class=DQMTextRun SCX45489217DQM>&nbsp;o</span><span class=DQMTextRun SCX45489217DQM>f when it sold to the government. But&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Lulubelle</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;Johnson had a son named Ford Johnson because&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Lulubelle</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Johnson was a niece of Henry Ford, made the automobiles. And we stayed there&nbsp;</span><span class=DQMTextRun SCX45489217DQM>at that house and it was just&mdash;</span><span class=DQMTextRun SCX45489217DQM>it</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was wonderful. We had good neighbors, fruit orchards all over.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;All over.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;When they said that you will find all the fruit you</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>want, they really meant it.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And so what sort of fruit was on the farm you grew up on?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Oh, we had--</span><span class=DQMTextRun SCX45489217DQM>we grew alfalfa. If you didn't grow alfalfa, you grew fruit. But we had a good well on our land, and</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>alfalfa was a good-paying crop. And of course, we had a cow. And if we had too much alfalfa, we could sell it. So it</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>wasn't something</span><span class=DQMTextRun SCX45489217DQM>&nbsp;that went bad. And the fruit--</span><span class=DQMTextRun SCX45489217DQM>every kind of fruit. First time I ever tasted cherries or even seen a</span><span class=DQMTextRun SCX45489217DQM>&nbsp;cherry tree was there. O</span><span class=DQMTextRun SCX45489217DQM>r ever ate an apricot or se</span><span class=DQMTextRun SCX45489217DQM>en an apricot. Or even apples--we had apples there&mdash;wonderful.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And the whole valley was full of that. It wasn't just one little orchard, it was lots of orchards. It was</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>covered with orchards and alfalfa fields. Yeah.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Did you have electricity?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;We did! F</span><span class=DQMTextRun SCX45489217DQM>irst time we had electricity. We had electricity shortly before we moved from North Dakota because I</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>remember my mother had a Maytag washing machine that she had just bought and paid $2 a month for.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So we</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>had that all packed up an</span><span class=DQMTextRun SCX45489217DQM>d ready to go and our tickets--</span><span class=DQMTextRun SCX45489217DQM>the government gave us tickets to get out of a depressed</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>area. And we took the Emp</span><span class=DQMTextRun SCX45489217DQM>ire Builder--brand new--</span><span class=DQMTextRun SCX45489217DQM>to Spokane, and came into White Bluffs on a fruit train with</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>our little parcel of stuff. And they welcomed us with open arms. And they were [AUDIO OUT]</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So you mentioned t</span><span class=DQMTextRun SCX45489217DQM>hat there was a well. Is that--</span><span class=DQMTextRun SCX45489217DQM>how were your crops irrigated with it?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oh, well, we had sprinkler systems. They weren't like they are now. But what we had, you dug the ditch across the</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>field. And then you made little rows out of that on both sides. And you would run it from the well pipe into that big</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>main ditch. And then you would take the little ditches and close them&nbsp;</span><span class=DQMTextRun SCX45489217DQM>up. When you've got enough irrigation water,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>you'd close them back up. And that's what we did. That's how we did it. And that's how they water the orchards.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And how about running water? Did you have--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>We didn't have running water in the house. We went out and got it by the bucketful off of the well. There was a</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>little faucet and you could either pull it up with a bucket or you could turn the faucet on. There was a pump.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;It's the</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>same one you watered the yard with. But it was grand to have all the fresh water you needed because we paid</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>$0.25 a barrel in North Dakota for drinking water because it was a rancid and acrid. $0.25 then was a lot of</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>money. We washed clothes with it. My mother would take it after she washed clothes and scrub her floors. And</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they were white from the lye in the soap. And then s</span><span class=DQMTextRun SCX45489217DQM>he would put it on her garden. But w</span><span class=DQMTextRun SCX45489217DQM>e never had bugs on the</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>garden.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER].</span><span class=DQMTextRun SCX45489217DQM><br /></span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM><span>Bauman</span></span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So I was&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>gonna</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;ask you--</span><span class=DQMTextRun SCX45489217DQM>who were some of your neighbors?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Let me see,&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Beldins</span></span><span class=DQMTextRun SCX45489217DQM>.&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Beldi</span></span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>ns</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;were one of our neighbors. Summers were some of our neighbors. And I can't even</span><span class=DQMTextRun SCX45489217DQM>&nbsp;remember what--his kid's name was--</span><span class=DQMTextRun SCX45489217DQM>oh, I can't say his name. He kind of talked with a nasal. And my dad called</span><span class=DQMTextRun SCX45489217DQM>&nbsp;him Snazzy Summers. [LAUGHTER]&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I don't know where that came from. But a</span><span class=DQMTextRun SCX45489217DQM>nyways, he was--</span><span class=DQMTextRun SCX45489217DQM>he had a crush on my sister</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Helen. And Helen didn't like him. Of course, she was only about 12 or 13. I don't think she had boys in mind. She</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was kind of a tomboy, too. They were some of our neighbors.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And we lived-- the Abercrombie place was north of us. And down below us was an abandoned place. And they</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>must have made wine of some kind, because they grew grapes and the grapes were still there. They grew right</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>down to the water. We would go down and get these great big, beautiful Tokay red grapes. And they were right</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>there by the river so they had enough water. But then the whole farm was</span><span class=DQMTextRun SCX45489217DQM>&nbsp;completely abandoned, probably&nbsp;</span><span class=DQMTextRun SCX45489217DQM>because of the Depression. I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>really&nbsp;</span><span class=DQMTextRun SCX45489217DQM>don't know. But they we</span><span class=DQMTextRun SCX45489217DQM>re the neighboring ones. And&nbsp;</span><span class=DQMTextRun SCX45489217DQM>t</span><span class=DQMTextRun SCX45489217DQM>he&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Grewells</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;lived up above us. Helen and Gerald Grewell</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was the</span><span class=DQMTextRun SCX45489217DQM>ir name. And Helen Grewell</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was my sis</span><span class=DQMTextRun SCX45489217DQM>ter Helen's very favorite girl.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>They</span><span class=DQMTextRun SCX45489217DQM>&rsquo;d ru</span><span class=DQMTextRun SCX45489217DQM>n around all the time.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And how about you? Who were some of your best friends</span><span class=DQMTextRun SCX45489217DQM>--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oh, Patsy Borden was my best friend for a while. She was probably my be</span><span class=DQMTextRun SCX45489217DQM>st friend, yes. And she was the granddaughter of the&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Saths</span></span><span class=DQMTextRun SCX45489217DQM>, who were related to the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Wie</span><span class=DQMTextRun SCX45489217DQM>hls who run the ferry. And Ida Mae&nbsp;</span><span class=DQMTextRun SCX45489217DQM>probably was another little friend. She was a nice little girl. I like</span><span class=DQMTextRun SCX45489217DQM>d them all. We actually--</span><span class=DQMTextRun SCX45489217DQM>there wasn't a whole lot</span><span class=DQMTextRun SCX45489217DQM>&nbsp;of--</span><span class=DQMTextRun SCX45489217DQM>kids had to go hom</span><span class=DQMTextRun SCX45489217DQM>e and go do things. It wasn't--I remember the Kilian&nbsp;</span><span class=DQMTextRun SCX45489217DQM>children because they were</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>German. And they came there, I want to say about '37, '38. Hitler was already busy in Germany. And they came</span><span class=DQMTextRun SCX45489217DQM>&nbsp;home. And they Mrs. Supple</span><span class=DQMTextRun SCX45489217DQM>&nbsp;used to</span><span class=DQMTextRun SCX45489217DQM>&nbsp;raise sheep. Her and husband--</span><span class=DQMTextRun SCX45489217DQM>th</span><span class=DQMTextRun SCX45489217DQM>ey were&nbsp;</span><span class=DQMTextRun SCX45489217DQM>German also, very, very&nbsp;</span><span class=DQMTextRun SCX45489217DQM>German. Nice people, but she thought Hitler was doing such great things over t</span><span class=DQMTextRun SCX45489217DQM>here for the German people. And so Mr. Kilian</span><span class=DQMTextRun SCX45489217DQM>&nbsp;went over and had a long talk with her and said, you know</span><span class=DQMTextRun SCX45489217DQM>, you are putting yourself in a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>dangerous position, because this is not going well in Germany. He might be doin</span><span class=DQMTextRun SCX45489217DQM>g things for the German people,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>but he has things in mind for the world. And I thought, how kind. How provocati</span><span class=DQMTextRun SCX45489217DQM>ve and kind that was. It wasn't&nbsp;</span><span class=DQMTextRun SCX45489217DQM>necessary for him to do that. He really didn't know them. But he had heard things. An</span><span class=DQMTextRun SCX45489217DQM>d in a little community, things&nbsp;</span><span class=DQMTextRun SCX45489217DQM>like that get around. It isn't gossip, it's just fear. But I thought that was very kind. I was only about 7, 8 years old.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I was going to ask you about-- did you have certain chores or responsibilities--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Always.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>--that you had to do on the farm?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Everybody did. Everybody did. Mine was feeding the chickens and gathering the eggs. And we had a l</span><span class=DQMTextRun SCX45489217DQM>ittle hen&nbsp;</span><span class=DQMTextRun SCX45489217DQM>named Grandma that mother picked out of the shell, and Billy Rooster, who</span><span class=DQMTextRun SCX45489217DQM>&nbsp;I guess was named after me. He&nbsp;</span><span class=DQMTextRun SCX45489217DQM>turned out beautiful. But little Grandma Hen was sterile, so she must have been to</span><span class=DQMTextRun SCX45489217DQM>o weak. But she kept her in the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>warming oven for an extra couple hours, and she picked her out of the shell. She</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was sterile. And she would run&nbsp;</span><span class=DQMTextRun SCX45489217DQM>around stealing everybody else's chicks. She would have a couple of Rhode Is</span><span class=DQMTextRun SCX45489217DQM>land Reds, and she would have a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>couple of little Leghorns, and maybe a little Barred Rock or two. And she'd hudd</span><span class=DQMTextRun SCX45489217DQM>le them up and boy, she'd fight them off--she's going to keep these kids. Well, Mrs.&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Sath</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;was such a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>sweetheart. They lived in the--</span><span class=DQMTextRun SCX45489217DQM>next to us.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;And she brought my mother some&nbsp;</span><span class=DQMTextRun SCX45489217DQM>duck eggs-- white Peking duck eggs. And she said, why&nbsp;</span><span class=DQMTextRun SCX45489217DQM>don't you</span><span class=DQMTextRun SCX45489217DQM>&nbsp;just set her.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;She's dying to and she doesn't know--</span><span class=DQMTextRun SCX45489217DQM>she'd fight them off. And so they set about 10 eggs under her because d</span><span class=DQMTextRun SCX45489217DQM>uck eggs are pretty good sized.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And she hatched out every one, and she was so proud of them. Oh, boy, she'd just stomp around</span><span class=DQMTextRun SCX45489217DQM>&nbsp;that farmyard&nbsp;</span><span class=DQMTextRun SCX45489217DQM>like she really knew what she was doing. And she just took them down to the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>horse trough one time. And they&nbsp;</span><span class=DQMTextRun SCX45489217DQM>found the horse trough, and they jumped&nbsp;</span><span class=DQMTextRun SCX45489217DQM>in. And she just went berserk--</span><span class=DQMTextRun SCX45489217DQM>DQMcome bac</span><span class=DQMTextRun SCX45489217DQM>k, come back.DQM And so it got to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>be a morning thing. Every morning she'd take them to the horse trough because t</span><span class=DQMTextRun SCX45489217DQM>hey had to have their swim. But she raised them. [LAUGHTER]&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Those things were fun things. We didn't have TV. We had a little, tiny radio that w</span><span class=DQMTextRun SCX45489217DQM>e could listen to for the news.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>But it wasn't a thing you had on all day. But Billy Rooster used to hear the music a</span><span class=DQMTextRun SCX45489217DQM>nd he would try to keep up with&nbsp;</span><span class=DQMTextRun SCX45489217DQM>it. And my sister Dorothy would always do the lunch dishes. She'd say, Billy Rooste</span><span class=DQMTextRun SCX45489217DQM>r, are you out there singing to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>this music?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;It was very wholesome.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Mm-hm.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>What other sorts of things did you do for fun?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>The&nbsp;</span><span class=DQMTextRun SCX45489217DQM>river</span><span class=DQMTextRun SCX45489217DQM>. Oh, the river. The river was a godsend. We learned to swim the first</span><span class=DQMTextRun SCX45489217DQM>&nbsp;year, the first summer we were&nbsp;</span><span class=DQMTextRun SCX45489217DQM>there. And we had a raft. The dads had got together and built this big raft. And if you</span><span class=DQMTextRun SCX45489217DQM>&nbsp;could swim out to the raft&mdash;I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was not supposed t</span><span class=DQMTextRun SCX45489217DQM>o, but I did. And the little Lowe</span><span class=DQMTextRun SCX45489217DQM>&nbsp;boy wasn't supposed to,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>either. He was just learning to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>swim. And he went under. And my sister Dorothy was a really good swimmer.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And he went under for the third&nbsp;</span><span class=DQMTextRun SCX45489217DQM>time. And she went down and got him, g</span><span class=DQMTextRun SCX45489217DQM>ot him out on that--</span><span class=DQMTextRun SCX45489217DQM>pulled him up. And there was a couple of guys up</span><span class=DQMTextRun SCX45489217DQM>&nbsp;there</span><span class=DQMTextRun SCX45489217DQM>&nbsp;pulled him up on that raft and they turned them over on his stomach. And the water just poured. And he</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>lived. But he wouldn't have lived.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And every one of those kids at White Bluffs were just as devoted as that to the river. That was our playground. We</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>had&nbsp;</span><span class=DQMTextRun SCX45489217DQM>to do our work in the morning because it was cool enough. An</span><span class=DQMTextRun SCX45489217DQM>d the summers over there were--</span><span class=DQMTextRun SCX45489217DQM>boy, they&nbsp;</span><span class=DQMTextRun SCX45489217DQM>were hot. But we could go in and get in the swimming pool then, our swimming pool.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>You mentioned a little bit ago having a radio. Did you have a telephone also?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>We finally did have a telephone. And it was only a dollar a month. That was righ</span><span class=DQMTextRun SCX45489217DQM>t uptown. We'd never had one of&nbsp;</span><span class=DQMTextRun SCX45489217DQM>those before. It was a party line, so if there was an emergency, you had to gi</span><span class=DQMTextRun SCX45489217DQM>ve up the line. If there was an emergency--</span><span class=DQMTextRun SCX45489217DQM>if you didn't, they would take your telephone out and you'd never get</span><span class=DQMTextRun SCX45489217DQM>&nbsp;a telephone again. So that was&nbsp;</span><span class=DQMTextRun SCX45489217DQM>good and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>responsible. And I think Mrs.&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Westling</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;was the telephone--</span><span class=DQMTextRun SCX45489217DQM>she had it in her</span><span class=DQMTextRun SCX45489217DQM>&nbsp;home. She and her&nbsp;</span><span class=DQMTextRun SCX45489217DQM>daughter, I believe, operated it, I'm pretty sure. They lived up by the bank, I rememb</span><span class=DQMTextRun SCX45489217DQM>er that. But I can't tell you--</span><span class=DQMTextRun SCX45489217DQM>we didn't have names on the streets that I know of.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And so did you get your news mostly on the radio? Was there a newspaper also?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;There was.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>There was a little newspaper there. And I believe it was for Hanford and White&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Bluffs. And my brother actually&nbsp;</span><span class=DQMTextRun SCX45489217DQM>worked for that newspaperman. First you start out just because he thought it w</span><span class=DQMTextRun SCX45489217DQM>ould be fun. Phil asked him, he&nbsp;</span><span class=DQMTextRun SCX45489217DQM>said, would you like to know something about publishing a newspaper? And so</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Dutch went and worked for him. That's what we called him--</span><span class=DQMTextRun SCX45489217DQM>we didn't call him Virgil. And he went and worked for him</span><span class=DQMTextRun SCX45489217DQM>. And they did publish a little&nbsp;</span><span class=DQMTextRun SCX45489217DQM>newspaper. It&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was a weekly, just once a week.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And, of course, they had all the Ladies Aid tea parties, things like that, things a</span><span class=DQMTextRun SCX45489217DQM>t the church. Everything was in&nbsp;</span><span class=DQMTextRun SCX45489217DQM>there. Yeah, a little gossipy paper. It wasn't malicious. It was just who had a lunch</span><span class=DQMTextRun SCX45489217DQM>eon at their place or whatever.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And so, when he got older and came out of the Army, he went and took formal ne</span><span class=DQMTextRun SCX45489217DQM>wspapering, went to college and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>took it. And he became a newspaperman. Boise Statesman was one of them. And&nbsp;</span><span class=DQMTextRun SCX45489217DQM>he went down to California. And&nbsp;</span><span class=DQMTextRun SCX45489217DQM>he worked down there for a while, about 10 years there. So that was good for him.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>He got started in--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Yeah, yeah.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>What businesses do you remember being in White Bluffs?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Well, I remember Rei</span><span class=DQMTextRun SCX45489217DQM>erson's Grocery. And I remember around the back of it&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was a little creamery where you could--</span><span class=DQMTextRun SCX45489217DQM>in fact, they picked up a can of cream at our back porch every mornin</span><span class=DQMTextRun SCX45489217DQM>g, because we had, by then, two&nbsp;</span><span class=DQMTextRun SCX45489217DQM>cows. And one was a Guernsey and one was a Jersey, and they both had lots of cr</span><span class=DQMTextRun SCX45489217DQM>eam. So we couldn't use all the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>cream, even for six kids.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So they would come and pick that up. And my sister, Helen, alway</span><span class=DQMTextRun SCX45489217DQM>s did the ironing. She&nbsp;</span><span class=DQMTextRun SCX45489217DQM>liked to iron. That was her job. And so he would come, and here she'd be on that ba</span><span class=DQMTextRun SCX45489217DQM>ck porch, early in the morning,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>starting the ironing.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;And he says, I don't think you've gone to bed. He was a kidder.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;But that was what she did, and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>she was excellent at it.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So there was Rei</span><span class=DQMTextRun SCX45489217DQM>erson's and--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And the creamery. And there was a little garage back there, and I can't rem</span><span class=DQMTextRun SCX45489217DQM>ember the name of it because we&nbsp;</span><span class=DQMTextRun SCX45489217DQM>didn't have a car. But there was a little garage back there. And there was Pop English's drugsto</span><span class=DQMTextRun SCX45489217DQM>re. Everybody&nbsp;</span><span class=DQMTextRun SCX45489217DQM>knew where that was. Pop English and his wife had no children. But they owned this little drugstore. And they</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>made the best ice cream in the world, and he sold it there. And you could have an ice cream cone for a nickel. I</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>mean it was an ice cream cone. And a dime was a double dipper, and it had&nbsp;</span><span class=DQMTextRun SCX45489217DQM>two shelves and then one cone&mdash;</span><span class=DQMTextRun SCX45489217DQM>it</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>went down to one cone. And that was a dime. And it was&nbsp;</span><span class=DQMTextRun SCX45489217DQM>hard, if you had a dime,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>to decide whether you wanted to do that or not.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I remember my mother used to give us two penni</span><span class=DQMTextRun SCX45489217DQM>es for Jesus to take to Sunday s</span><span class=DQMTextRun SCX45489217DQM>ch</span><span class=DQMTextRun SCX45489217DQM>ool. And I always put one in. I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>figured Jesus wouldn't care if I have a rope licorice from Pop English's. And years late</span><span class=DQMTextRun SCX45489217DQM>r, I told her, I said, Mama, if&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I would have known that Jesus didn't want my money like I do n</span><span class=DQMTextRun SCX45489217DQM>ow--</span><span class=DQMTextRun SCX45489217DQM>he wants our&nbsp;</span><span class=DQMTextRun SCX45489217DQM>love, has nothing to do with my two cents--</span><span class=DQMTextRun SCX45489217DQM>I would have brought you h</span><span class=DQMTextRun SCX45489217DQM>ome one. She says, your Sunday s</span><span class=DQMTextRun SCX45489217DQM>cho</span><span class=DQMTextRun SCX45489217DQM>ol dress was the messiest thing&nbsp;</span><span class=DQMTextRun SCX45489217DQM>ever. She says it was always was covered in black. And, she says, the rest of the girls I could just&nbsp;</span><span class=DQMTextRun SCX45489217DQM>press the back&nbsp;</span><span class=DQMTextRun SCX45489217DQM>of that little white dress with some water and make it good for next Sunday.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And she says, they could wear a Sunday s</span><span class=DQMTextRun SCX45489217DQM>chool dress for all month [AUDIO OUT]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;but you</span><span class=DQMTextRun SCX45489217DQM>. But she says, I never knew that.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;And I said, well, I says, if I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>would've known better, which I know now, you'd have had one, too.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;By then I was about 47 years old.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Oh, t</span><span class=DQMTextRun SCX45489217DQM>alking about the school in White Bluffs, how large was it, how many students do&nbsp;</span><span class=DQMTextRun SCX45489217DQM>you think there were, and maybe&nbsp;</span><span class=DQMTextRun SCX45489217DQM>the teachers that you remember particularly--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I would say that, in my first and second grade class, there was 18 that I can na</span><span class=DQMTextRun SCX45489217DQM>me off, that I can remember. We&nbsp;</span><span class=DQMTextRun SCX45489217DQM>had a little boy come there named Carter House. And I think his father was so</span><span class=DQMTextRun SCX45489217DQM>mething to do with engineering.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Allard, Sam Allard kept the irrigation system and the electric thing, and I think Mr.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;House had something to do with&nbsp;</span><span class=DQMTextRun SCX45489217DQM>it. But we had never seen a child look like this before. He looked li</span><span class=DQMTextRun SCX45489217DQM>ke he stepped out of a catalog.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>He had this blonde-- beautiful boy-- had this little blonde hair all cut so nice. And he wo</span><span class=DQMTextRun SCX45489217DQM>re little argyle knee socks&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and little suit pants and a little white shirt and little slaps on his shoes. And I thou</span><span class=DQMTextRun SCX45489217DQM>ght, my gosh, that's the cutest&nbsp;</span><span class=DQMTextRun SCX45489217DQM>little boy I've ever seen. And, of course, he didn't know how to share. And one day I was swinging on the sw</span><span class=DQMTextRun SCX45489217DQM>ing,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and Alice Moody looked out the window. And here was this little boy grabbing tha</span><span class=DQMTextRun SCX45489217DQM>t swing and taking it away from&nbsp;</span><span class=DQMTextRun SCX45489217DQM>me. And she says, we don't do that here. She says, you have to wait yo</span><span class=DQMTextRun SCX45489217DQM>ur turn. She says, when Leatris is done&nbsp;</span><span class=DQMTextRun SCX45489217DQM>with it, she says, you can have it. It'll be your turn.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;But they were probably nice peop</span><span class=DQMTextRun SCX45489217DQM>le, it's just that they weren't&nbsp;</span><span class=DQMTextRun SCX45489217DQM>White Bluffs-oriented.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And so you want to talk about Alice Moody a little bit? She was your first--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Ah, she was a wonderful teacher.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>--grade teacher, is that right?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Wonderful lady. She taught first, second, and, I believe, possibly third. And there</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was probably, I would suppose,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>18 in the first grade, and probably close to that in second. And then there wa</span><span class=DQMTextRun SCX45489217DQM>s the third grade. And we had&mdash;we&nbsp;</span><span class=DQMTextRun SCX45489217DQM>did not have separate rooms, but we had little partitions that she would p</span><span class=DQMTextRun SCX45489217DQM>ut up so that we would keep our&nbsp;</span><span class=DQMTextRun SCX45489217DQM>attention. And we did have monitors. Everybody helped everybody. If there was a l</span><span class=DQMTextRun SCX45489217DQM>ittle boy that needed help with&nbsp;</span><span class=DQMTextRun SCX45489217DQM>numbers and somebody was good with it, she would assign them to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>help that child. It wasn't--it was probably the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>most together community. If something was unfair on the playground, it was put&nbsp;</span><span class=DQMTextRun SCX45489217DQM>a stop to right away, sometimes&nbsp;</span><span class=DQMTextRun SCX45489217DQM>by the children. And teachers, if they were in their room, they kept a window open in good weath</span><span class=DQMTextRun SCX45489217DQM>er because if&nbsp;</span><span class=DQMTextRun SCX45489217DQM>there was anything wrong in the playground, it was either reported or taken care&nbsp;</span><span class=DQMTextRun SCX45489217DQM>of. And I can't remember fights&nbsp;</span><span class=DQMTextRun SCX45489217DQM>on school. I can't remember that, ever. It would never have been tolerated.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>How did you get to school, did you walk--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Oh, y</span><span class=DQMTextRun SCX45489217DQM>es</span><span class=DQMTextRun SCX45489217DQM>.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>--or did you ride the bus?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Everybody walked. The only children I r</span><span class=DQMTextRun SCX45489217DQM>emember that came in on a bus--oh, what was his name</span><span class=DQMTextRun SCX45489217DQM>&mdash;</span><span class=DQMTextRun SCX45489217DQM>Mr</span><span class=DQMTextRun SCX45489217DQM>.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Fisher's&nbsp;</span><span class=DQMTextRun SCX45489217DQM>school bus. Mr. Fisher,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;I believe. A</span><span class=DQMTextRun SCX45489217DQM>nd he came in on a little bus--</span><span class=DQMTextRun SCX45489217DQM>with a li</span><span class=DQMTextRun SCX45489217DQM>ttle bus. And I think they were&nbsp;</span><span class=DQMTextRun SCX45489217DQM>probably from out toward Saddle Mountain and farms like that because the</span><span class=DQMTextRun SCX45489217DQM>y had to go to school. But I do&nbsp;</span><span class=DQMTextRun SCX45489217DQM>remember a little bus. And I don't even remember that it was painted yellow or anythi</span><span class=DQMTextRun SCX45489217DQM>ng. I think it kind of reminded&nbsp;</span><span class=DQMTextRun SCX45489217DQM>me of maybe a van. But it had windows in it and</span><span class=DQMTextRun SCX45489217DQM>&nbsp;it</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was kind of squared. It seems like it was dark gray.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Mm-hm.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And so far was the school from your home?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oh,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I, let me see. We had to pass&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Saths</span></span><span class=DQMTextRun SCX45489217DQM>&rsquo; o</span><span class=DQMTextRun SCX45489217DQM>rchard, the whole leng</span><span class=DQMTextRun SCX45489217DQM>th of their orchard, and then&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Beldins</span></span><span class=DQMTextRun SCX45489217DQM>&rsquo;.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And then we had to walk across the front&nbsp;</span><span class=DQMTextRun SCX45489217DQM>of&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Beldins</span></span><span class=DQMTextRun SCX45489217DQM>&rsquo;</span><span class=DQMTextRun SCX45489217DQM>&nbsp;and their [AUDIO OUT]&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was pretty good sized. And then we had to walk up past&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Summers</span><span class=DQMTextRun SCX45489217DQM>'</span><span class=DQMTextRun SCX45489217DQM>&nbsp;up the hill to our house. So I would supp</span><span class=DQMTextRun SCX45489217DQM>ose it was probably a mile. And&nbsp;</span><span class=DQMTextRun SCX45489217DQM>some of them walked a lot more than that. And Mrs. Moody used to bring ki</span><span class=DQMTextRun SCX45489217DQM>ds in with her when she came to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>school because she drove to school. And she was</span><span class=DQMTextRun SCX45489217DQM>&nbsp;around the Reach, around the--</span><span class=DQMTextRun SCX45489217DQM>it</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was last reactor. And Old Town&nbsp;</span><span class=DQMTextRun SCX45489217DQM>used to be there. The whole town used to be on the river at one time. But they moved it away because I think t</span><span class=DQMTextRun SCX45489217DQM>hey&nbsp;</span><span class=DQMTextRun SCX45489217DQM>were progressing. People were moving in, spreading out. Orchards were filling&nbsp;</span><span class=DQMTextRun SCX45489217DQM>in. And I think that's why they probably moved the town. But</span><span class=DQMTextRun SCX45489217DQM>&nbsp;we had a movie theater. We had a movie thea</span><span class=DQMTextRun SCX45489217DQM>ter. And somebody from the Tri-</span><span class=DQMTextRun SCX45489217DQM>Cities came over with a movie. In the summertime, we had a movie once a week,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;probably in the evening early,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>about seven. And then, in the wintertime, it was kind of hit and miss whenever the</span><span class=DQMTextRun SCX45489217DQM>y could get over or whatever, I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>don't know. I can't remember. But we did have movies there.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Do you remember any movies that you saw</span><span class=DQMTextRun SCX45489217DQM>&nbsp;over there</span><span class=DQMTextRun SCX45489217DQM>?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>No, I wouldn't remember that. I probably wouldn't even have understood it.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>But it wasn't anything that was&nbsp;</span><span class=DQMTextRun SCX45489217DQM>offensive because they didn't do that.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Where was the movie theater in relationship to some of the other businesses</span><span class=DQMTextRun SCX45489217DQM>--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Okay, across the street from Rei</span><span class=DQMTextRun SCX45489217DQM>erson's Grocery, and also across the cross street wher</span><span class=DQMTextRun SCX45489217DQM>e the railroad came to fill the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>cars, that was</span><span class=DQMTextRun SCX45489217DQM>&nbsp;right across the street from Rei</span><span class=DQMTextRun SCX45489217DQM>erson's Grocery as you come in t</span><span class=DQMTextRun SCX45489217DQM>o White Bluffs. Then there was a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>main drag. And there was a railroad hotel there, because they had railroad workers</span><span class=DQMTextRun SCX45489217DQM>&nbsp;that, when they went out to do things to the railroad--the rails out there--</span><span class=DQMTextRun SCX45489217DQM>they had to have people. And then they</span><span class=DQMTextRun SCX45489217DQM>&nbsp;also rented to other people if&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they came in and there was a room empty. And it was right&nbsp;</span><span class=DQMTextRun SCX45489217DQM>across the street from Reierson's Grocery from this&nbsp;</span><span class=DQMTextRun SCX45489217DQM>one that's burned off. And behind there was a building. And that's wh</span><span class=DQMTextRun SCX45489217DQM>ere they had the movie theater.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And it was just an old building, I d</span><span class=DQMTextRun SCX45489217DQM>on't know. It had seats in it--</span><span class=DQMTextRun SCX45489217DQM>not wonderful, but seats. And then t</span><span class=DQMTextRun SCX45489217DQM>hey had a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>balcony on it, too, so that was good. Kids would go up there and of course,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;you know. One time we had some holy r</span><span class=DQMTextRun SCX45489217DQM>ollers in there that rented it.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;And they were rolling around on the floor.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;And my brother and his buddies&nbsp;</span><span class=DQMTextRun SCX45489217DQM>were up there taking toilet paper, throwing rolls down t</span><span class=DQMTextRun SCX45489217DQM>here. They were all in little--</span><span class=DQMTextRun SCX45489217DQM>I don't know, rolling around.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]&nbsp;</span><span class=DQMTextRun SCX45489217DQM>The Spirit moved them, I guess. Boy, they got in trouble for that.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;But it was used for</span><span class=DQMTextRun SCX45489217DQM>&nbsp;a lot of things. If they had a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>commu</span><span class=DQMTextRun SCX45489217DQM>nity meeting or something, they</span><span class=DQMTextRun SCX45489217DQM>'d either use it, the high school or that little</span><span class=DQMTextRun SCX45489217DQM>&nbsp;building, depending on what it&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was about. Sometimes it was a farm meeting, or a new spray that was coming&nbsp;</span><span class=DQMTextRun SCX45489217DQM>out, or what they should do and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>shouldn't do.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Mm-hm.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I was going to ask you about any community events that you remember, either picnic</span><span class=DQMTextRun SCX45489217DQM>s, or Fourth of July things, or&nbsp;</span><span class=DQMTextRun SCX45489217DQM>boat races--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Boat races we had right there. They did not start in Tri-Cities. They started at White B</span><span class=DQMTextRun SCX45489217DQM>luffs. It was wonderful. Mr. Kilian</span><span class=DQMTextRun SCX45489217DQM>&nbsp;used to slice his big watermelons and sell them for $0.05.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Pop English us</span><span class=DQMTextRun SCX45489217DQM>ed to sell his ice cream cones.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oh, and the Ladies A</span><span class=DQMTextRun SCX45489217DQM>id always had something going--</span><span class=DQMTextRun SCX45489217DQM>cookies or something or a b</span><span class=DQMTextRun SCX45489217DQM>ake sale. And it was just a fun&nbsp;</span><span class=DQMTextRun SCX45489217DQM>time. And we had a band. We used to gather up a band and have m</span><span class=DQMTextRun SCX45489217DQM>usic there. It was pretty good.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And in the spring, we always had a little May Day thing. And we had a maypole. A</span><span class=DQMTextRun SCX45489217DQM>nd they would twine the strings&nbsp;</span><span class=DQMTextRun SCX45489217DQM>around it like they do. And we ha</span><span class=DQMTextRun SCX45489217DQM>d a program--quite a program--</span><span class=DQMTextRun SCX45489217DQM>at the high scho</span><span class=DQMTextRun SCX45489217DQM>ol. And we had one that we were&nbsp;</span><span class=DQMTextRun SCX45489217DQM>in that</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was the doll dance. And Alice&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Beyers</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was supposed to be the French</span><span class=DQMTextRun SCX45489217DQM>&nbsp;lady who had the dolls. And so&nbsp;</span><span class=DQMTextRun SCX45489217DQM>we had these cute little dresses on, little ballerina-type dresses. And she would c</span><span class=DQMTextRun SCX45489217DQM>ome around and wind us up. That&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was the first start of it, and we danced to the tune, the doll dance. [AUDIO OUT] old</span><span class=DQMTextRun SCX45489217DQM>, old, tune. And each one of us&nbsp;</span><span class=DQMTextRun SCX45489217DQM>she wound up. And we started dancing. And we would dance around this ma</span><span class=DQMTextRun SCX45489217DQM>ypole. And that was part of the program. And we had--</span><span class=DQMTextRun SCX45489217DQM>oh, I remember my sister had a reading. DQMI want to live in the house by the side of</span><span class=DQMTextRun SCX45489217DQM>&nbsp;the road, and be a friend of man,</span><span class=DQMTextRun SCX45489217DQM>DQM is the way it goes. And each stanza end</span><span class=DQMTextRun SCX45489217DQM>s with that. And every single--my mother tutored her, her teacher tutored her--</span><span class=DQMTextRun SCX45489217DQM>and at the end of every one of those stanzas when she got u</span><span class=DQMTextRun SCX45489217DQM>p there, DQMI want to live in the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>house by the side of the road and be friendly with men.DQM It brought down the hous</span><span class=DQMTextRun SCX45489217DQM>e, of course. Oh, my mother was&nbsp;</span><span class=DQMTextRun SCX45489217DQM>so embarrassed. She wa</span><span class=DQMTextRun SCX45489217DQM>s so embarrassed. [LAUGHTER] So when she-later in life--</span><span class=DQMTextRun SCX45489217DQM>when s</span><span class=DQMTextRun SCX45489217DQM>he had a beautiful garden and a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>family of her own, I found that on a plaque that you put out in your garden, an open b</span><span class=DQMTextRun SCX45489217DQM>ook with this on it in a plaque&nbsp;</span><span class=DQMTextRun SCX45489217DQM>form. And it said, DQMI want to live in the house by the side of the road and be a friend t</span><span class=DQMTextRun SCX45489217DQM>o man.DQM</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;I said, this is for old&nbsp;</span><span class=DQMTextRun SCX45489217DQM>memories, Helen</span><span class=DQMTextRun SCX45489217DQM>, and she laughed</span><span class=DQMTextRun SCX45489217DQM>. She had a good laugh out of that.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>You mentio</span><span class=DQMTextRun SCX45489217DQM>ned earlier your Sunday s</span><span class=DQMTextRun SCX45489217DQM>chool dress. What church did you go to?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Well, I think at that--</span><span class=DQMTextRun SCX45489217DQM>first, we went to the Presbyterian, but then they closed that.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;But then we went to the little&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Lutheran church I think was up in back of the bank. And we went there for a w</span><span class=DQMTextRun SCX45489217DQM>hile. But my dress was always a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>mess. I come home with licorice all over it because, of course, I had to stop and t</span><span class=DQMTextRun SCX45489217DQM>ake one of those pennies, buy a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>licorice at Pop English's drugstore.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Do you remember any other churches in the community?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I do not. I don't remember that there was Catholic&nbsp;</span><span class=DQMTextRun SCX45489217DQM>church</span><span class=DQMTextRun SCX45489217DQM>&nbsp;there. I</span><span class=DQMTextRun SCX45489217DQM>&nbsp;don't remember that there was.&nbsp;</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;I wonder&mdash;</span><span class=DQMTextRun SCX45489217DQM>I know that the&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Wanapum</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;people were in the area. I wonder&nbsp;</span><span class=DQMTextRun SCX45489217DQM>if you have any memories of the&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Wanapum</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;Indians, or--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Oh, yes. We had--I don't know that they--</span><span class=DQMTextRun SCX45489217DQM>they</span><span class=DQMTextRun SCX45489217DQM>&nbsp;were Johnny Buck's Indian tribe.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;My brother knew Frank Buck. He&nbsp;</span><span class=DQMTextRun SCX45489217DQM>had two wives. One was old and had</span><span class=DQMTextRun SCX45489217DQM>&nbsp;white hair, and her name was&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Deloria</span></span><span class=DQMTextRun SCX45489217DQM>. And I don't remember the other&nbsp;</span><span class=DQMTextRun SCX45489217DQM>one. But they were fine people. They came in and they would gather fruit off the gro</span><span class=DQMTextRun SCX45489217DQM>und because it was ready to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>dry. They would catch fish out of that river and smoke it and just grab your nos</span><span class=DQMTextRun SCX45489217DQM>e and want you to go down there&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and have some.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And they were just fine people.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>They ca</span><span class=DQMTextRun SCX45489217DQM>me in usually before cherries--</span><span class=DQMTextRun SCX45489217DQM>you would see them before cher</span><span class=DQMTextRun SCX45489217DQM>ries--</span><span class=DQMTextRun SCX45489217DQM>an</span><span class=DQMTextRun SCX45489217DQM>d then you would see them every&nbsp;</span><span class=DQMTextRun SCX45489217DQM>day out in the orchards. And nobody ever charged anybody for that. They could have all they wanted. And my</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>mother actually learned to dry fruit. And oh, that smelled good, just waft up and grab you by the nose. And they</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>put it in little, thin sheets like cheesecloth. Th</span><span class=DQMTextRun SCX45489217DQM>ey'd make a rack with willows--</span><span class=DQMTextRun SCX45489217DQM>ma</span><span class=DQMTextRun SCX45489217DQM>ke a rack,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>weave it, and put it&nbsp;</span><span class=DQMTextRun SCX45489217DQM>between maybe stumps of willows, little tiny seedling willows that were comin</span><span class=DQMTextRun SCX45489217DQM>g up. And they would make these&nbsp;</span><span class=DQMTextRun SCX45489217DQM>racks. And they would put this cheesecloth over it to keep the flies away. And they w</span><span class=DQMTextRun SCX45489217DQM>ould dry it. And they would dry fruit all summer long--</span><span class=DQMTextRun SCX45489217DQM>peaches, cherries, apricot, apples, everything. And they ta</span><span class=DQMTextRun SCX45489217DQM>ught my mother that if you soak&nbsp;</span><span class=DQMTextRun SCX45489217DQM>them just a few minutes in saltwater, they will not turn brown. And they won't salt th</span><span class=DQMTextRun SCX45489217DQM>e fruit. And so she learned how to do that. And the fish&mdash;oh! W</span><span class=DQMTextRun SCX45489217DQM>hen they smoked that fish, you wanted to go down there and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>just have some. It just smelled&nbsp;</span><span class=DQMTextRun SCX45489217DQM>delicious. They had a mixture they mixed up to put on it so it wouldn't dry it out</span><span class=DQMTextRun SCX45489217DQM>. And they would take the whole&nbsp;</span><span class=DQMTextRun SCX45489217DQM>bone out of it. They'd slice it. They take the scale off, the skin off, and the ribs</span><span class=DQMTextRun SCX45489217DQM>&nbsp;out. And they would place that&nbsp;</span><span class=DQMTextRun SCX45489217DQM>between these same little cloths and dry it. And they would smoke it from beneath and they'd ke</span><span class=DQMTextRun SCX45489217DQM>ep that just really&nbsp;</span><span class=DQMTextRun SCX45489217DQM>low. Oh, you could smell it al</span><span class=DQMTextRun SCX45489217DQM>l over the valley. You'd just--</span><span class=DQMTextRun SCX45489217DQM>oh! And it was deliciou</span><span class=DQMTextRun SCX45489217DQM>s. They did a good job. And&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they were i</span><span class=DQMTextRun SCX45489217DQM>nteresting. Interesting, interesting people.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And you know it was a good [AUDIO OUT] for kids. I remember my brother used go</span><span class=DQMTextRun SCX45489217DQM>&nbsp;up, 14 or 15 years old, he and his two buddies Leo and Louie Russo--Leo&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Goodner</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;and Louie Russo- and they'd go up to Saddle&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Mountain, take a little flour and little baking powder and maybe some salt and so</span><span class=DQMTextRun SCX45489217DQM>me lard. And they'd go up there&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and stay for a couple days. Nobody thought anything of it. There was a little sp</span><span class=DQMTextRun SCX45489217DQM>ring up there and it was always&nbsp;</span><span class=DQMTextRun SCX45489217DQM>green. And they'd just camp out and snare a rabbit or</span><span class=DQMTextRun SCX45489217DQM>&nbsp;whatever. They just couldn't--they just loved it. Usually he&nbsp;</span><span class=DQMTextRun SCX45489217DQM>went in good weather, yes. But we didn't have bad weather in summertime. But you</span><span class=DQMTextRun SCX45489217DQM>&nbsp;wouldn't let a 14-year-old kid&nbsp;</span><span class=DQMTextRun SCX45489217DQM>out now, three of them all by themselves?&nbsp;</span><span class=DQMTextRun SCX45489217DQM>[LAUGHTER]&nbsp;</span><span class=DQMTextRun SCX45489217DQM>But they had wonderful times. And it&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was a good place to raise kids,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and it was good place to be raised, too. Really good.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I want to ask you about the sheriff.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oh, Roy Bean was a fine man. I think I told you about him coming to get the boys to take the--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>You did before we started recording on the film--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Well, he was a deputy sheriff out of the Tri-Citie</span><span class=DQMTextRun SCX45489217DQM>s. And I think the main thing--</span><span class=DQMTextRun SCX45489217DQM>t</span><span class=DQMTextRun SCX45489217DQM>he office was up in probably&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Yakima, I'm not sure. But he had two little girls. And Roberta went to school&nbsp;</span><span class=DQMTextRun SCX45489217DQM>with me. And Loretta came along&nbsp;</span><span class=DQMTextRun SCX45489217DQM>later. She was younger by a couple of years. But he came to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>our house one morning, and he--we were just up.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Dutch wasn't up yet, my brother. But he said, I wonder, is Virgil up yet? And he sai</span><span class=DQMTextRun SCX45489217DQM>d, no, he said, but I'll go get&nbsp;</span><span class=DQMTextRun SCX45489217DQM>him. He said, what's he done now? And he says, he's sure going to get it if he's gott</span><span class=DQMTextRun SCX45489217DQM>en into trouble. And he says, now I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>want you to understand. He says, there's nothing going to be trouble about this, Joe. He says, I want you to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>go get&nbsp;</span><span class=DQMTextRun SCX45489217DQM>him up. He says, his two buddies are in my car. And, he says, we're going to do&nbsp;</span><span class=DQMTextRun SCX45489217DQM>a little favor for some people.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And he said, I don't want any repercussions about this. I don't want any quest</span><span class=DQMTextRun SCX45489217DQM>ions about it. If I hear of any&nbsp;</span><span class=DQMTextRun SCX45489217DQM>beatings about this, he says, I will deal with it. And my dad went in and got Dutch</span><span class=DQMTextRun SCX45489217DQM>&nbsp;up. And he came out and got in the car. He was dressed.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And they went up to the packing hous</span><span class=DQMTextRun SCX45489217DQM>e, which is right across from Rei</span><span class=DQMTextRun SCX45489217DQM>erson's G</span><span class=DQMTextRun SCX45489217DQM>rocery. And he says, now, we're&nbsp;</span><span class=DQMTextRun SCX45489217DQM>going to go get that car, which you pushed down this incline last night and release</span><span class=DQMTextRun SCX45489217DQM>d the brake. And he says, we're&nbsp;</span><span class=DQMTextRun SCX45489217DQM>going to push it back up that slight hill. It was probably down there about seven, eight blocks. Wel</span><span class=DQMTextRun SCX45489217DQM>l, it was uphill,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>now. It wasn't so easy. But, he says, I'll help you with the brake here. And he said, w</span><span class=DQMTextRun SCX45489217DQM>e'll keep this released. And he&nbsp;</span><span class=DQMTextRun SCX45489217DQM>said, we'll push this back u</span><span class=DQMTextRun SCX45489217DQM>p. So he got those three boys--probably 14, 15 years old--to push that car about&nbsp;</span><span class=DQMTextRun SCX45489217DQM>seven or eight blocks up to be iced. And he came home. He was pretty sweaty&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and he was pretty tired. And he&nbsp;</span><span class=DQMTextRun SCX45489217DQM>wanted some breakfast.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER] But n</span><span class=DQMTextRun SCX45489217DQM>othi</span><span class=DQMTextRun SCX45489217DQM>ng was ever mentioned about it.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And he was a fine man. He knew how to handle people. And he wasn't out there to bully anybody&nbsp;</span><span class=DQMTextRun SCX45489217DQM>or--</span><span class=DQMTextRun SCX45489217DQM>and later,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>he came to a family reunion. We called him up and invited him, because we knew he'd lived in Milton-</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Freewater</span></span><span class=DQMTextRun SCX45489217DQM>,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>him and his&nbsp;</span><span class=DQMTextRun SCX45489217DQM>wife. And, of course, Roberta-</span><span class=DQMTextRun SCX45489217DQM>I kept track of Roberta because she&nbsp;</span><span class=DQMTextRun SCX45489217DQM>moved here. That was his oldest&nbsp;</span><span class=DQMTextRun SCX45489217DQM>daughter. And so I was glad to meet them. And we invited him to the get-together</span><span class=DQMTextRun SCX45489217DQM>. And he mentioned that. And he laughed about it to Dutch.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Dutch was a little uneasy when he thought we were going to invite the Beans.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER] And I said, he&nbsp;</span><span class=DQMTextRun SCX45489217DQM>made a good joke out of it. He says, I've used that a lot of times, he said, on how&nbsp;</span><span class=DQMTextRun SCX45489217DQM>to and how not to. And he said,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>you turned out pretty good. He says, turned out pretty good.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Someone else I wanted to ask you about-- when we were talking earlier, you we</span><span class=DQMTextRun SCX45489217DQM>re mentioning a man named Ellis&nbsp;</span><span class=DQMTextRun SCX45489217DQM>John--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oh, Ellis John was an interesting person. He lived down in old town in just one of&nbsp;</span><span class=DQMTextRun SCX45489217DQM>the abandoned buildings. He had&nbsp;</span><span class=DQMTextRun SCX45489217DQM>been on some kind of a merchant ship. And somebody on that ship that worke</span><span class=DQMTextRun SCX45489217DQM>d with him attacked him. And he&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was beating on him, and he killed him. And so they sent him to a penitentiary. It was a</span><span class=DQMTextRun SCX45489217DQM>&nbsp;kind of an accidental killing.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>He did</span><span class=DQMTextRun SCX45489217DQM>n't mean to but he was really--</span><span class=DQMTextRun SCX45489217DQM>that's what I got out of it. But he lived</span><span class=DQMTextRun SCX45489217DQM>&nbsp;there. He came to White Bluffs&nbsp;</span><span class=DQMTextRun SCX45489217DQM>because it was such a nice little town. He came through there and he like</span><span class=DQMTextRun SCX45489217DQM>d it.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And he was an artist, a real artist. He did pictures of people. And he would mak</span><span class=DQMTextRun SCX45489217DQM>e a few bucks, did paintings of&nbsp;</span><span class=DQMTextRun SCX45489217DQM>them. An</span><span class=DQMTextRun SCX45489217DQM>d when I had my 10th birthday--</span><span class=DQMTextRun SCX45489217DQM>my mother used to leave vegetables and</span><span class=DQMTextRun SCX45489217DQM>&nbsp;fruit on his porch because she&nbsp;</span><span class=DQMTextRun SCX45489217DQM>knew he didn't have a garden. And she always left vegetab</span><span class=DQMTextRun SCX45489217DQM>les and fruit if we had extra--because we always had extra--</span><span class=DQMTextRun SCX45489217DQM>on his porch because he was kind of a recluse. But he would come out an</span><span class=DQMTextRun SCX45489217DQM>d talk to you. He was pleasant.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And when I had my 10th birt</span><span class=DQMTextRun SCX45489217DQM>hday, my folks bought Muriel&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Bel</span></span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>din&rsquo;s</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;girl's bi</span><span class=DQMTextRun SCX45489217DQM>ke for me to ride. And it was a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>smaller bike. And he painted roses on the fenders of that blue and white bike. And I</span><span class=DQMTextRun SCX45489217DQM>&nbsp;had the prettiest bike in town&nbsp;</span><span class=DQMTextRun SCX45489217DQM>when I moved to Walla Walla.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So I always remembered him&nbsp;</span><span class=DQMTextRun SCX45489217DQM>because I was fascinated with--</span><span class=DQMTextRun SCX45489217DQM>in</span><span class=DQMTextRun SCX45489217DQM>&nbsp;fact, I took art in&nbsp;</span><span class=DQMTextRun SCX45489217DQM>school because I was so fascinated with him. He would sit&nbsp;</span><span class=DQMTextRun SCX45489217DQM>there and sketch somebody and--right in front of your&nbsp;</span><span class=DQMTextRun SCX45489217DQM>eyes-- and make it live. And you wondered how he did that. He used charcoal a l</span><span class=DQMTextRun SCX45489217DQM>ot, and pen and ink, and paint.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Just-- and I always felt bad because his life was kind of w</span><span class=DQMTextRun SCX45489217DQM>asted there. He could've been--I mean he could make a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>likeness of anybody perfectly. But he chose to be there because we accepted him</span><span class=DQMTextRun SCX45489217DQM>, and we respected his privacy.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>He had been through a lot. And I don't think he was a murderous person. I think it was something that happened.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So when and why did your family leave White Bluffs?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Well, in 1937, Hitler was very busy. And by 1941, he</span><span class=DQMTextRun SCX45489217DQM>&nbsp;was even busier. And in June--in April of 1941, we moved to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Walla Walla. My dad says, there's going to be some military. He says, you can bet you</span><span class=DQMTextRun SCX45489217DQM>r sweet life. He says, it's big&nbsp;</span><span class=DQMTextRun SCX45489217DQM>enough to have some military. And he said, I want to be where there's some</span><span class=DQMTextRun SCX45489217DQM>&nbsp;jobs. And so we moved to Walla Walla.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And there was a veterans' hospital here and he was a veteran. And he said, I jus</span><span class=DQMTextRun SCX45489217DQM>t think it'd be better, because&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they had surveyed our area in 1937, '36 or '37, I'm not sure which. But we kep</span><span class=DQMTextRun SCX45489217DQM>t surveyors at our house, so we&nbsp;</span><span class=DQMTextRun SCX45489217DQM>knew they were surveying for something. And it took them</span><span class=DQMTextRun SCX45489217DQM>, oh,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;a couple years to surve</span><span class=DQMTextRun SCX45489217DQM>y all that area that they were&nbsp;</span><span class=DQMTextRun SCX45489217DQM>looking at.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>But you didn't know what they were--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>They didn't even know what they were surveying for. They were hired by the Uni</span><span class=DQMTextRun SCX45489217DQM>ted States government. And they&nbsp;</span><span class=DQMTextRun SCX45489217DQM>were employees of the United States government. So we kept Mama an</span><span class=DQMTextRun SCX45489217DQM>d Daddy Redd, we called them. And&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they were nice people. They had no children, and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they just loved us. They just--</span><span class=DQMTextRun SCX45489217DQM>she taught us really good things,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>things that we hadn't learned from our mom. Mama didn't know how to make fudge. She'd never had that much</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>sugar to spare in her life.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So we all learned how to make fudge and pe</span><span class=DQMTextRun SCX45489217DQM>nuche and good stuff from Ma Redd.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So you knew they were working for the government, but you didn't know--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>We didn't know. They didn't know. But they were there about, I would say, two ye</span><span class=DQMTextRun SCX45489217DQM>ars. So I associate it with the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Manhattan Project because it's a logical. Hitler was busy. Oh boy, was he busy.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So I don't know. It might have&nbsp;</span><span class=DQMTextRun SCX45489217DQM>been, it might not have been. We thought it was an irrigation project. We were so excited, because an</span><span class=DQMTextRun SCX45489217DQM>&nbsp;irrigation&nbsp;</span><span class=DQMTextRun SCX45489217DQM>project [AUDIO OUT] would have given us more, see, I mean, you could have irrigated more land. But--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So how were you when you left White Bluffs and you moved</span><span class=DQMTextRun SCX45489217DQM>--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I had my 11th birthday here. It was in the spring of 1941. And we didn't have war un</span><span class=DQMTextRun SCX45489217DQM>til 1941, December 7.&nbsp;</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So as a 10- and 11-year-old girl, what did you think of leaving White Bluffs and moving to Walla Walla?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Oh, I thought I was going to die. For one thing, they had a Holstein cow over at&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Margaret Stearns's where w</span><span class=DQMTextRun SCX45489217DQM>e lived in&nbsp;</span><span class=DQMTextRun SCX45489217DQM>her little house when we came here. And my father took care of her yard and m</span><span class=DQMTextRun SCX45489217DQM>ilked her cow and separated the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>milk. It was a Holstein cow. That's like skim milk. I didn't drink milk for a year. I coul</span><span class=DQMTextRun SCX45489217DQM>dn't handle it. I mean, we were used to--</span><span class=DQMTextRun SCX45489217DQM>we had cream on top of</span><span class=DQMTextRun SCX45489217DQM>&nbsp;the</span><span class=DQMTextRun SCX45489217DQM>&nbsp;milk. And then we sold half of it to the little dair</span><span class=DQMTextRun SCX45489217DQM>y. And, I says, this is what we&nbsp;</span><span class=DQMTextRun SCX45489217DQM>slop the pigs with. I'm not drinking th</span><span class=DQMTextRun SCX45489217DQM>is. And they worried about me--</span><span class=DQMTextRun SCX45489217DQM>I wasn't dri</span><span class=DQMTextRun SCX45489217DQM>nking milk. But it was probably&nbsp;</span><span class=DQMTextRun SCX45489217DQM>better for me, but I wasn't used to it. I wasn't used to it. The Scandinavian blood in&nbsp;</span><span class=DQMTextRun SCX45489217DQM>me calls for that milk with the&nbsp;</span><span class=DQMTextRun SCX45489217DQM>fat in it.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER]</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Did you keep in contact with the people from White Bluffs after you moved here to Walla Walla?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I knew Bonnie Morris w</span><span class=DQMTextRun SCX45489217DQM>as here, and her sister, Ruth--</span><span class=DQMTextRun SCX45489217DQM>her sister-in-law, Ruth. They were both Mor</span><span class=DQMTextRun SCX45489217DQM>ris girls. And I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>don't think they were sisters. I think they were cousins because we had two Morris f</span><span class=DQMTextRun SCX45489217DQM>amilies there. But Ruth went to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>school with my sister Dorothy at White Bluffs High School. And I went to school&nbsp;</span><span class=DQMTextRun SCX45489217DQM>with Bonnie Morris, who went to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>White Bluffs Grade School. And I'll tell you what, I was sure jealous of that gi</span><span class=DQMTextRun SCX45489217DQM>rl. She could do handstands and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>cartwheels all around the White Bluffs Grade School and not stop. She could do a</span><span class=DQMTextRun SCX45489217DQM>&nbsp;flip over and throw herself up&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and come</span><span class=DQMTextRun SCX45489217DQM>&nbsp;down on her feet. And I just--</span><span class=DQMTextRun SCX45489217DQM>I w</span><span class=DQMTextRun SCX45489217DQM>as just amazed.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>She was a couple years older than me, or I thought she was. But I don't think so. I&nbsp;</span><span class=DQMTextRun SCX45489217DQM>think she was probably close to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>my age. She probably--</span><span class=DQMTextRun SCX45489217DQM>maybe</span><span class=DQMTextRun SCX45489217DQM>&nbsp;it was one year. But she was a fantastic athlete. Even t</span><span class=DQMTextRun SCX45489217DQM>he boys envied her. I mean, she&nbsp;</span><span class=DQMTextRun SCX45489217DQM>could just flip around like a circus performer. And here I was, a tomboy, but&nbsp;</span><span class=DQMTextRun SCX45489217DQM>not delightful with things like&nbsp;</span><span class=DQMTextRun SCX45489217DQM>gymnastics. The</span><span class=DQMTextRun SCX45489217DQM>re was always somebody we envy</span><span class=DQMTextRun SCX45489217DQM>&nbsp;when we were kids.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So in 1943, a couple years after you moved away, the federal government came in and--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Cleaned out everything.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;--everybody&nbsp;</span><span class=DQMTextRun SCX45489217DQM>had to leave. Did you hear about that from people you used</span><span class=DQMTextRun SCX45489217DQM>--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>My sister was living there.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Oh, she was, okay.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;She was living in the Johnson place. She said nobody&nbsp;</span><span class=DQMTextRun SCX45489217DQM>ever came and got the beautiful&nbsp;</span><span class=DQMTextRun SCX45489217DQM>antiques she had upstairs. She had a teapot that came over on&nbsp;</span><span class=DQMTextRun SCX45489217DQM>the Mayflower. The legs were--it was a silver&nbsp;</span><span class=DQMTextRun SCX45489217DQM>teapot, and the legs were actually worn completely off. And it had the Ford name on it.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So which sister was this, then, who had</span><span class=DQMTextRun SCX45489217DQM>--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>That w</span><span class=DQMTextRun SCX45489217DQM>as Dorothy, my oldest sister that</span><span class=DQMTextRun SCX45489217DQM>&nbsp;I love so much.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And why had she stayed there?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>She stayed there because she had husband who was a truck driver. And she w</span><span class=DQMTextRun SCX45489217DQM>as expecting her first baby and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>didn't really know what else to do. And he was gone.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Was this someone she had met in White Bluffs, then, or--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>She met him in Kennewick. She was working at Kennewick General Hospital&nbsp;</span><span class=DQMTextRun SCX45489217DQM>at the time. And she met Vern&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Fouracre</span></span><span class=DQMTextRun SCX45489217DQM>.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And they got mar</span><span class=DQMTextRun SCX45489217DQM>ried at our house. In fact, we&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>c</span></span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>hivareed</span></span><span class=DQMTextRun SCX45489217DQM>&nbsp;them at o</span><span class=DQMTextRun SCX45489217DQM>ur house. And that was probably when--</span><span class=DQMTextRun SCX45489217DQM>I was 13 when I was an aunt, so Colleen was born in '43. And she wasn't</span><span class=DQMTextRun SCX45489217DQM>&nbsp;born there. She was born&mdash;she&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was pregnant when she was there but she was born after that. And that's w</span><span class=DQMTextRun SCX45489217DQM>hen they moved them out. They&nbsp;</span><span class=DQMTextRun SCX45489217DQM>had to move everybody out. And I always wondered whatever became of Mrs</span><span class=DQMTextRun SCX45489217DQM>.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;John</span><span class=DQMTextRun SCX45489217DQM>son's beautiful things, because&nbsp;</span><span class=DQMTextRun SCX45489217DQM>they were museum things. They should've been in a museum. They shouldn't have been in an attic.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Right.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Where did your sister and her husba</span><span class=DQMTextRun SCX45489217DQM>nd go, then, when they had to leave?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Well, they went back to Kennewick. And Colleen was born in Kennewick.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Was born in--</span><span class=DQMTextRun SCX45489217DQM>[AUDIO OUT] Then she came&nbsp;</span><span class=DQMTextRun SCX45489217DQM>to Walla&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Walla. And she had a little boy a year or two later. She had four.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Have you ever gone back to--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>We went to the Hanford-White Bluffs picnics, I think, four or five times. And then,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;of course, the people who were doing the arranging for it--</span><span class=DQMTextRun SCX45489217DQM>Annette Hereford and I can't remember the other boy. I can't remember the boy.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Man off-camera</span>: Bob Grisham, maybe?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I believe, I believe. They graduated high school with Dorothy. And they just were get</span><span class=DQMTextRun SCX45489217DQM>ting too old to do that. And it&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was hard thing. And people were dying off. But Alice Moody was at the last one. I wa</span><span class=DQMTextRun SCX45489217DQM>s, too. And I loved seeing her.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And I knew her immediately. She looked just like herself, just exactly.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>So when you went to the reunions, it usually was a picnic, right, at the park, Howard Amon Park. Did you also</span><span class=DQMTextRun SCX45489217DQM>&nbsp;do a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>tour</span><span class=DQMTextRun SCX45489217DQM>--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Mm-hm.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>We did, we did. We could take our car in. First time, I think they had a bus for pe</span><span class=DQMTextRun SCX45489217DQM>ople who had no transportation, because the Tri-Cities had--</span><span class=DQMTextRun SCX45489217DQM>they were old. Some people weren't driving anymore.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So they evidently had acquired&nbsp;</span><span class=DQMTextRun SCX45489217DQM>a bus for some that couldn't. And whoever had room in cars, we took them. But o</span><span class=DQMTextRun SCX45489217DQM>urs was always full because our&nbsp;</span><span class=DQMTextRun SCX45489217DQM>kids were just fascinated by this. And we went to the dinners, little&nbsp;</span><span class=DQMTextRun SCX45489217DQM>banquets that we had you. Mr. Reierson was&nbsp;</span><span class=DQMTextRun SCX45489217DQM>there.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>What did you think when you had a chance to go back and see the land, the area where--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Broke my heart. Just broke my hear</span><span class=DQMTextRun SCX45489217DQM>t. We had a hard time finding--</span><span class=DQMTextRun SCX45489217DQM>we wouldn't have found where our house was,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>except there was a water tank associated with this pump. And&nbsp;</span><span class=DQMTextRun SCX45489217DQM>it set out front. It was made--</span><span class=DQMTextRun SCX45489217DQM>and a lot of the people</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>had them. Some of them had brick with a liner in it. But this one was cement and was kind of cone-shaped, and</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>evidently was a holding tank for the house, or whatever. I don't know, I'm not sure.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;But it was there. And that was&nbsp;</span><span class=DQMTextRun SCX45489217DQM>still there. They hadn't knocked t</span><span class=DQMTextRun SCX45489217DQM>hat down. That's the only way--</span><span class=DQMTextRun SCX45489217DQM>and it set up on a hill</span><span class=DQMTextRun SCX45489217DQM>. It was the first row of hills&nbsp;</span><span class=DQMTextRun SCX45489217DQM>as y</span><span class=DQMTextRun SCX45489217DQM>ou came down toward the river--dropped down the river to Old T</span><span class=DQMTextRun SCX45489217DQM>own. An</span><span class=DQMTextRun SCX45489217DQM>d so, that was how we found it.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>But there wasn't any stumps of trees left. There wasn't anything left. They actuall</span><span class=DQMTextRun SCX45489217DQM>y had the crew of conscientious&nbsp;</span><span class=DQMTextRun SCX45489217DQM>objectors at McNeil Island come down and cut the trees and the wood out of ther</span><span class=DQMTextRun SCX45489217DQM>e, and took it back for fuel by&nbsp;</span><span class=DQMTextRun SCX45489217DQM>truckloads. And that was the la</span><span class=DQMTextRun SCX45489217DQM>st, just before they released--</span><span class=DQMTextRun SCX45489217DQM>they were already sta</span><span class=DQMTextRun SCX45489217DQM>rting to build the reactors and&nbsp;</span><span class=DQMTextRun SCX45489217DQM>things and dig the systems underneath</span><span class=DQMTextRun SCX45489217DQM>, and storage thing under the--</span><span class=DQMTextRun SCX45489217DQM>But it wa</span><span class=DQMTextRun SCX45489217DQM>s a wonderful place to grow up,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and I don't know that they'll ever get it cleaned up.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Anything that we haven't talked about yet in terms of White Bluffs, any stories o</span><span class=DQMTextRun SCX45489217DQM>r events that stand out that we&nbsp;</span><span class=DQMTextRun SCX45489217DQM>haven't had a chance to talk about?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I just think it was the best place to the world to raise kids because there was a comm</span><span class=DQMTextRun SCX45489217DQM>unity spirit-- that I never saw&nbsp;</span><span class=DQMTextRun SCX45489217DQM>favoritism. I never saw belligerence about minding rules. I always saw a humanit</span><span class=DQMTextRun SCX45489217DQM>arianism. If you knew that your&nbsp;</span><span class=DQMTextRun SCX45489217DQM>husband or your neighbors or anybody was having a problem, you didn't make it y</span><span class=DQMTextRun SCX45489217DQM>our business. You didn't gossip&nbsp;</span><span class=DQMTextRun SCX45489217DQM>about it. It wasn't a usual. It was more of any empathy, more of a symp</span><span class=DQMTextRun SCX45489217DQM>athetic,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>let'</span><span class=DQMTextRun SCX45489217DQM>s just do what we can for them.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I never saw the malice toward anybody because they were poor or maybe did&nbsp;</span><span class=DQMTextRun SCX45489217DQM>something wrong. If there was a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>wrong committed, it was straightened out and talked about by the two people that did it. And it was left</span><span class=DQMTextRun SCX45489217DQM>&nbsp;alone.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And they had a tavern there. [AUDIO OUT] And, even there, it was not tolerated fo</span><span class=DQMTextRun SCX45489217DQM>r people to act like a bunch of savages or fights or--</span><span class=DQMTextRun SCX45489217DQM>It was a place to go have a cold beer if you wanted one</span><span class=DQMTextRun SCX45489217DQM>, but I don't remember a lot of drunkenness or--</span><span class=DQMTextRun SCX45489217DQM>I don't&nbsp;</span><span class=DQMTextRun SCX45489217DQM>think he would have--</span><span class=DQMTextRun SCX45489217DQM>Harry somebody was his name. I</span><span class=DQMTextRun SCX45489217DQM>t ended up two people owned it,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>but I can't remember what their name was.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Oh, the tavern?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;And we were gone, but they told us abou</span><span class=DQMTextRun SCX45489217DQM>t it. And I can't remember, but&nbsp;</span><span class=DQMTextRun SCX45489217DQM>that was the last of it. And it was just a little tavern. I</span><span class=DQMTextRun SCX45489217DQM>&nbsp;probably, I don't know--</span><span class=DQMTextRun SCX45489217DQM>it was prob</span><span class=DQMTextRun SCX45489217DQM>ably four or five little tables&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and maybe a row along the bar. I remember standing out there one time becaus</span><span class=DQMTextRun SCX45489217DQM>e my dad went in to have a beer&nbsp;</span><span class=DQMTextRun SCX45489217DQM>with a friend. And I said, well I'll wait out here and eat this ice cream cone from Pop&nbsp;</span><span class=DQMTextRun SCX45489217DQM>English. [LAUGHTER] I knew what to do with it.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>He was a fine man. He actually&nbsp;</span><span class=DQMTextRun SCX45489217DQM>organized the White Bluffs band.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Oh, right.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;T</span><span class=DQMTextRun SCX45489217DQM>he high sc</span><span class=DQMTextRun SCX45489217DQM>hool band. And he made room for&nbsp;</span><span class=DQMTextRun SCX45489217DQM>everybody. Ev</span><span class=DQMTextRun SCX45489217DQM>erybody had-- Ola Meeks</span><span class=DQMTextRun SCX45489217DQM>&nbsp;could do the baton twirl, and she taught two other</span><span class=DQMTextRun SCX45489217DQM>&nbsp;girls to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>do that. An</span><span class=DQMTextRun SCX45489217DQM>d they had white pants with&nbsp;</span><span class=DQMTextRun SCX45489217DQM>a</span><span class=DQMTextRun SCX45489217DQM>--</span><span class=DQMTextRun SCX45489217DQM>it's either black or n</span><span class=DQMTextRun SCX45489217DQM>avy blue stripe down the side--</span><span class=DQMTextRun SCX45489217DQM>and a white shirt,</span><span class=DQMTextRun SCX45489217DQM>&nbsp;just a&nbsp;</span><span class=DQMTextRun SCX45489217DQM>plain little white shirt. The girls wore a white blouse. And everybody had a part in&nbsp;</span><span class=DQMTextRun SCX45489217DQM>high school band. And they went&nbsp;</span><span class=DQMTextRun SCX45489217DQM>up to Yakima and they&nbsp;</span><span class=DQMTextRun SCX45489217DQM>took first place. That little</span><span class=DQMTextRun SCX45489217DQM>-- and competing against Ke</span><span class=DQMTextRun SCX45489217DQM>nnewick, Pasco? It was amazing!&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Somewhere we have a picture, and I don't have the picture. I can't find it.</span><span class=DQMTextRun SCX45489217DQM>&nbsp;[LAUGHTER] But</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Dorothy ju</span><span class=DQMTextRun SCX45489217DQM>st loved it. She played a drum,&nbsp;</span><span class=DQMTextRun SCX45489217DQM>and she just loved it. And they did&nbsp;</span><span class=DQMTextRun SCX45489217DQM>a good job.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>No, it was a fine place to grow up. And it was sad, because it really was a ne</span><span class=DQMTextRun SCX45489217DQM>ighborhood community. And there&nbsp;</span><span class=DQMTextRun SCX45489217DQM>were people who</span><span class=DQMTextRun SCX45489217DQM>&nbsp;had plenty, I mean, they had--</span><span class=DQMTextRun SCX45489217DQM>there were well-to-do people there.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>But they didn't flaunt it. They&nbsp;</span><span class=DQMTextRun SCX45489217DQM>were no different when they&nbsp;</span><span class=DQMTextRun SCX45489217DQM>went to the Grange meeting. Or whether they&nbsp;</span><span class=DQMTextRun SCX45489217DQM>were entertaining, it was not&mdash;there&nbsp;</span><span class=DQMTextRun SCX45489217DQM>was not any class distinction. And especially at school I noticed it. That's&nbsp;</span><span class=DQMTextRun SCX45489217DQM>unusual. That's unusual. And we&nbsp;</span><span class=DQMTextRun SCX45489217DQM>welcomed it.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Well, I want to thank you very much for letting us come here and talk to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>you today, and for sharing your&nbsp;</span><span class=DQMTextRun SCX45489217DQM>memories--</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Well, you use what you can. I know you you'll cut, because, of course, you can't.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>You have to do what you have to&nbsp;</span><span class=DQMTextRun SCX45489217DQM>do. But I know that people are going to give you some wonderful stories, storie</span><span class=DQMTextRun SCX45489217DQM>s about how they were accepted.&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And I'm sure every one of those people that you interview will tell you the same</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>thing, that</span><span class=DQMTextRun SCX45489217DQM>&nbsp;it was a wonderful&nbsp;</span><span class=DQMTextRun SCX45489217DQM>community.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Thanks again very much. I appreciate it.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>I appreciate you</span><span class=DQMTextRun SCX45489217DQM>r</span><span class=DQMTextRun SCX45489217DQM>&nbsp;coming.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><strong><span class=DQMTextRun SCX45489217DQM>Northwest P</span><span class=DQMTextRun SCX45489217DQM>ublic Television |&nbsp;</span><span class=DQMTextRun SCX45489217DQM><span class=DQMSpellingError SCX45489217DQM>Reid_Leatris</span></span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></strong></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>: My name is Leatris</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Faye&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Boehmer Reid. B-O-E-H-M-E-R. It's pronounced DQMbay--DQM DQMbay-mer.DQM And I was born</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>in North Dakota in 1930.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Just before we get started on that</span><span class=DQMTextRun SCX45489217DQM>, I just need to get the date on here, make sure we have everything. And so we're</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>recording this on August 27, 2013.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Okay</span><span class=DQMTextRun SCX45489217DQM>, August 27.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>And we're recording it in your home in Walla Walla.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM>
--]]


textToRead = {"<span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Okay</span><span class=DQMTextRun SCX45489217DQM>.&nbsp;</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Yeah, let's have you talk about your family and how your family came to White Bluffs.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;First?</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>Yeah.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Reid</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;Okay</span><span class=DQMTextRun SCX45489217DQM>.</span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM><span class=DQMTextRun SCX45489217DQM>Reid</span></span><span class=DQMTextRun SCX45489217DQM>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;I came here in</span><span class=DQMTextRun SCX45489217DQM>&nbsp;</span><span class=DQMTextRun SCX45489217DQM>June to White Bluffs, Washington in 1935 or '36. I'm pretty sure it was '36 because I had my sixth birthday there.</span><span class=DQMEOP SCX45489217DQM>&nbsp;</span></span></p>RRR</div>RRR<div class=DQMOutlineElement Ltr SCX45489217DQM>RRR<p class=DQMParagraph SCX45489217DQM><span class=DQMTextRun SCX45489217DQM><span style=DQMtext-decoration: underline;DQM>Bauman</span>:</span><span class=DQMTextRun SCX45489217DQM>&nbsp;So you said you were born in North Dakota and moved to White Bluffs in 1936."}

toChange = "[I;isSgoogle.com]"


-- ************************************************************************************* --



-- Your user settings (you can change these how you please) --

go_FAST = true                  -- Will skip out on extra information but will make program go slightly faster.
case_sensitive = true           -- This option is NOT YET WORKING (EVERYTHING right now IS case sensitive).
open_link_in_a_new_tab = false  -- Extra HTML is added to links to open them in a new tab when clicked. 

--------------------------------------------------------------


--------------- CODE (Do not change anything below) -------------------------------------------

IS_STABLE = true

-- Logs --
function updateLogs()
t = ("UpdateLogs ( OLD ) \n V56 \n * Output seportators functional \n ** $$<label> <here>$$ \n ** Space and two word label is currently MANDATORY \n V54-55 \n * VERY UNSTABLE Version - lots of new features being implemented + bugs being worked out \n * WANT to add customizable âcodesâ \n ** such as seperating output text \n ** MAYBE the ,*<number> and ,*00<number> \n * Reworking the âmain codeâ function \n * Seperate output text with $$<label name>$$ \n V53 \n * Some delay time/function available so virtual interpreter doesn't crash \n * Check toChange for duplicates \n V52 \n * UNSTABLE Version \n * Elapsed time \n V51 \n *! Deatails of this version are under UpdateLogs \n * Program IS functional but WITH few Bugs \n * Case sense UNSTABLE \n * Reorganization of code (more understandable) \n V50 \n * UNSTABLE Version \n * New case sensitive option (WIP) \n * (WIP) This <*>,* added for optional case sensitive feature (otherwise NOT case sensitive) \n * (WIP) Capital letters addressed \n V48-49 \n * More information on text given \n ** different words \n ** words total \n ** different repeated words \n * The ,*00<number> now FULLY functional \n V47 \n * Help function being implemented \n * The ,*00<number> now SEMI functional \n V46 \n * Mostly-stable Version \n * The ,*00<number> not yet functional \n * Most everything working \n V44-45 \n * UNSTABLE Version \n * Working on new toChange modifiers \n V43 \n * UNSTABLE Version \n V41-42 \n * Fixed all known errors \n * Finished Example Inputs and Outputs \n * Made amount_of_links work with new updates of V41 \n * Allow numbers in URL names \n * Allow collons, foward slashes in URL names \n V40 \n * Fixed spacing conflict \n * Program will now know if user wants to change amount_of_links \n * User now has option to add ,*<number> to decide how many occurrences of the link they would like added to their text (number MUST be positive). \n ** ,*00 would link unlimited times \n ** ,*0 would NOT link the hyperlink at all \n ** ,*<number> would link how ever many times <number> was \n V1-39 \n * Basic program created")
return t
end
if IS_STABLE then
-- Create all variables --
function createVars()
  endingPunct = ",;:?!{}[]()"
  endingPTable = {",", ";", ":", "?", "!", "{", "}", "[", "]", "(", ")"}
  cpOfOriginal = textToRead[1]
  website_extentions_you_use_link = ".com.org.edu.us.gov.de.cn.net.uk.info.nl.eu.ru.mil.int.biz.jobs.mobi.name.tel.br.ca.cn.fr.in.jp"
  i_would_like_to_view_help = false
  show_extra_info = false
  caseStorage = ""
  caseStorageB = ""
  alreadyRepeatingWords = ""
  myRepeatTable = {}
  myRepeatString = ""
  myInvTable = {}
  myInvString = ""
  didRepeatWords = 0
  totalWords = 0
  wordsThatRepeat = 0
  amountToLink = {}
  toBeLinked = {}
  hyperLinkToGive = {}
  wordLookingAt = ""
  firstWord = ""
  counter = 1
  replace = true
  canRun = true
  firstTime = true
  webExtentions = {}
  timesToGo = 999999
  numberOfLinks = 0
  if not open_link_in_a_new_tab then newTabText = "" else newTabText = ' target="_blank"' end
end
-- Sub functions --
function wait(seconds)
  -- I did not make this wait function.
  local start = os.time()
  repeat until os.time() > start + seconds
end
function canUse(tbl, num)
  toreturn=true
  for i=1, #tbl do
    if tbl[i]==num then
      toreturn = false
    end
  end
  return toreturn
end
function fixPunctuation(y)
  allPositions = {}
  local locs = {}
  lastttr = ""
  for i=1, string.len(y) do
    local threes = string.sub(y, i, i+2)
    if string.sub(threes, 1, 1) == "x" and string.sub(threes, 3, 3) == "x" then
      -- <  x  !  x  _ 
      -- 66 67 68 69 70
      foundi = i+1
      qt = {}
      for j=-2, 2, 1 do
        table.insert(qt, #qt+1, j+foundi)
      end
      table.remove(qt, 3)
      table.insert(locs, #locs+1, qt)
    else
      lastttr = lastttr .. threes
    end
  end
for i=1, #locs do for j=1, #locs[i] do table.insert(allPositions, #allPositions+1, locs[i][j]) end end
  lastttr2 = ""
  for k=1, string.len(y) do
    if canUse(allPositions, k) then
      lastttr2=lastttr2..string.sub(y, k, k)
    end
  end
  y=lastttr2
  return y
end

function fixSpace(samestr)
  yesAdd = true
  amountOfDbls = 0
  newstring,tempA = "",""
  
  for i=1, string.len(samestr) do
    local ltr = samestr:sub(i, i)
    if string.len(tempA)<6 then
      tempA=tempA..ltr
    else
      tempA=tempA:sub(2, string.len(tempA))
    end
    if ltr == "<" then
      yesAdd = false
    end
    if ltr == ">" then
      yesAdd = true
    end
    if yesAdd and ltr~=">" then
      newstring=newstring..ltr
    end
  end
  
  newstring = (string.gsub(string.gsub(newstring, "RRR", "\n"), " ", "", 1))
  for i=1, string.len(newstring) do
    mypositions = {}
    tempB = string.sub(newstring, i, i+5)
    if tempB:match("&nbsp;") then
      table.insert(mypositions, #mypositions+1, {i, i+1, i+2, i+3, i+4})
    end
    --for k,v in pairs(mypositions) do print(k,v) for k2,v2 in pairs(mypositions[k]) do print(k2,v2, newstring:sub(v2, v2)) end end
  end
  
  newstringD=""
  ignore = false
  newstringC=""
  newstringB = string.gsub(samestr, " ", "", 1)
  spceCount = 0
  toadd = true
  countAsString = false
  myi = 1
  for i=1, string.len(newstringB) do
    local myltr  = newstringB:sub(i, i)
    if myltr == "<" then ignore = true end
    if myltr == ">" then ignore = false end
    if not ignore then newstringD=newstringD..newstringB:sub(i, i) end
    if not ignore and myltr == " " then
      if spceCount > 1 then
        toadd=false
        spceCount=0
      end
      spceCount=spceCount+1
    end
    if toadd then 
      newstringC=newstringC..myltr
    end
    toadd=true
    myi=myi+1
  end

  print(newstringC, "\n")
  print(newstringD, "\n")
  return newstringB
end

function checkPTable(letter)
  ptablecheck=false
  for i=1, #endingPTable do
    if endingPTable[i]==letter then
      ptablecheck=true
      break
    end
  end
  return ptablecheck
end
function punctuation()
  newttr = ""
  for i=1, string.len(textToRead[1]) do
    local letter = string.sub(textToRead[1], i, i)
    if checkPTable(letter) then
      letter = " x"..letter.."x "
      newttr = newttr .. letter
    else
      newttr = newttr .. letter
    end
  end
  textToRead[1] = newttr
end
function checkSpace(text)
  cnt=0
  for word in string.gmatch(text, "%s") do
    cnt=cnt+1
  end
  if cnt==2 or cnt<2 then
    return string.gsub(text, " ", "")
  else
    local t = string.sub(text, 2, string.len(text)-1)
    return t
  end
end
function getRightNumber(number)
    number = tonumber(number)
    returnNum = ""
    if number == 0 then
      returnNum = "zero"
    elseif number == 1 then
      returnNum = "one"
    elseif number == 2 then
      returnNum = "two"
    elseif number == 3 then
      returnNum = "three"
    elseif number == 4 then
      returnNum = "four"
    elseif number == 5 then
      returnNum = "five"
    elseif number == 6 then
      returnNum = "six"
    elseif number == 7 then
      returnNum = "seven"
    elseif number == 8 then
      returnNum = "eight"
    elseif number == 9 then
      returnNum = "nine"
    end
    return returnNum
  end
function checkRepeatCount()
  amountOfRepeats = 0
  newRepeatString = ""
  newRepeatTable = {}
  for i=1, #myRepeatTable do
    for j=1, #myRepeatTable do
      if j~=i and myRepeatTable[i]==myRepeatTable[j] then
        if newRepeatString:match(myRepeatTable[i]) == nil then newRepeatString=newRepeatString..myRepeatTable[i] table.insert(newRepeatTable, #newRepeatTable+1, myRepeatTable[i]) end
      end
    end
  end
  amountOfRepeats=#newRepeatTable
  return amountOfRepeats
end
function makeIndividuals(word)
  if myInvString:match(word) == nil then
    myInvString=myInvString..word
    table.insert(myInvTable, #myInvTable+1, word)
  end
end
function checkForRepeat(word)
  doesrepeat = false
  for i=1, #myRepeatTable do
    if alreadyRepeatingWords:match(word) == nil then
      if myRepeatString:match(word)~=nil then
        alreadyRepeatingWords=alreadyRepeatingWords..word
        doesrepeat = true
      end
    end
  end
  return doesrepeat
end
function fixCase()
  z = ""
  caseIterator = 1
  for i=1, string.len(textToRead[1]) do
    if string.sub(textToRead[1], i, i):match("%w") then
      local l = string.sub(textToRead[1], i, i)
      if string.gsub(string.sub(caseStorage, caseIterator, caseIterator), " ", "")=="u" then
        z=z..string.upper(l, i, i)
      else
        z=z..string.lower(l, i, i)
      end
      caseIterator=caseIterator+1
    else
      z=z..string.sub(textToRead[1], i, i)
    end
  end
  return z
end
function isUpper(chr)
  bool = false
  if chr == string.upper(chr) then bool = true end
  return bool
end
function useStringCode(code)
  local check = tostring(amountToLink[counter])
  if check == "00" then
    timesToGoC = 999999
  elseif check == "0" then
    timesToGoC = 0
  elseif check:match("00%d") ~= nil and string.len(check) == 3 then
    timesToGoC = {}
    table.insert(timesToGoC, 1, string.sub(check, 2, 3))
  elseif check:match("00%d%d") ~= nil and string.len(check) == 4 then
    timesToGoC = {}
    table.insert(timesToGoC, 1, string.sub(check, 3, 4))
  else
    timesToGoC = tonumber(amountToLink[counter])
  end
  return timesToGoC
end
function fixUpTags()
  newFixedTagText = ""
  loopCounter = 1
  giveSpace = true
  for i=1, string.len(textToRead[1]) do
    letter2 = string.sub(textToRead[1], i, i+1)
    didmodify=false
    if letter2:sub(1, 1)==">" and letter2:sub(2, 2):match("%a+") ~= nil then
      local nextLetter = letter2:sub(2, 2)
      local addition = letter2:sub(1, 1) .. " "
      newFixedTagText=newFixedTagText..addition
    elseif letter2:sub(2, 2)=="<" and letter2:sub(1, 1):match("%a+") ~= nil then
      newFixedTagText=newFixedTagText..string.sub(textToRead[1], i, i).." "
      giveSpace=false
    else
      if giveSpace then
        newFixedTagText=newFixedTagText..string.sub(textToRead[1], i, i)
      end
      if not giveSpace and string.sub(textToRead[1], i, i)~=" " then
        newFixedTagText=newFixedTagText..string.sub(textToRead[1], i, i)
      end
      if not giveSpace and string.sub(textToRead[1], i, i)==" " then
        -- do NOT add another space character.
        giveSpace=true
      end
    end
  end
  string.gsub(newFixedTagText, "   ", " ")
  string.gsub(newFixedTagText, "  ", " ")
  return newFixedTagText
end
function mainCode(it, timesToGo)
  if amount_of_links_enabled then timesToGo = useStringCode(amountToLink[counter]) end
    
  if tonumber(timesToGo) and textToRead[1]:match(toBeLinked[it]) then
    if textToRead[1]:match(toBeLinked[it]) then
      local toGive = ' <a' .. newTabText .. ' href="' .. hyperLinkToGive[it] .. '">' .. string.gsub(toBeLinked[it], " ", "") .. '</a>'
      x = string.gsub(textToRead[1], toBeLinked[it], toGive, timesToGo)
      numberOfLinks=numberOfLinks+1
      textToRead[1] = x
    end
  else
    local percent = tonumber(timesToGo[1])
    local tfTable = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}}
    tfTable1 = {true, false, false, false, false, false, false, false,false}
    tfTable2 = {true, false, false, false, false, false, false, false, true}
    tfTable3 = {true, false, false, false, true, false, false, false, true}
    tfTable4 = {true, false, false, true, false, true, false, false, true}
    tfTable5 = {true, false, true, false, true, false, true, false, true}
    tfTable6 = {} for i=1, 9 do table.insert(tfTable6, #tfTable6+1, not tfTable5[i]) end
    tfTable7 = {} for i=1, 9 do table.insert(tfTable7, #tfTable7+1, not tfTable4[i]) end
    tfTable8 = {} for i=1, 9 do table.insert(tfTable8, #tfTable8+1, not tfTable3[i]) end
    tfTable9 = {} for i=1, 9 do table.insert(tfTable9, #tfTable9+1, not tfTable2[i]) end
  
  --[[
  
  1 2 3 4 5 6 7 8 9
  ========================
  1 0 0 0 0 0 0 0 0      1     10  10/1 = 10  -4                                       -4               4   +0
  1 0 0 0 0 0 0 0 1      2      5  10/2 =  5  +5 and 5 -4                              -4 +4            9   +5
  1 0 0 0 1 0 0 0 1      3      3  10/3 =  3  +2 and 3 +6 and 3 -2                     -2 +4 +3         10  +1     // math.floor()
  1 0 0 1 0 1 0 0 1      4      2  10/4 =  2  -1 and 2 +2 and 2 +4 and 2 +7            -1 +4 +5 +3      14  +4     // math.floor()
  1 0 1 0 1 0 1 0 1      5      2  10/5 =  2  -1 and 2 +1 and 2 +3 and 2 +5 and 2 +7   -1 +4 +5 +5 +1   17  +3       
  
  
  
  1 2 3 4 5 6 7 8 9 10
  ======================== x
  1 0 0 0 0 0 0 0 0  0     1     -4
  1 0 0 0 0 0 0 0 1  0     2     -4 +4
  1 0 0 0 1 0 0 0 1  0     3     -4 +0 +4
  1 0 0 1 0 1 0 0 1  0     4     -4 -1 +1 +4
  1 0 1 0 1 0 1 0 1  0     5     -4 -2 -0 +2 +4
  
  
  for i=1, 9 do
    for j=1, 10 do
      if i == j then
        
      end
    end
  end
  ]]
    
  end
end
function checkDup()
    noDup = true
    local allToChanges = {}
    local x = 1
    for word in string.gmatch(toChange, "%a+%;") do
      if noDup then
        myword = string.lower(string.gsub(word, ";", ""))
        for i=1, #allToChanges do
          if allToChanges[i] == myword then
            noDup = {false, i, myword, x}
            break
          end
        end
        table.insert(allToChanges, #allToChanges+1, myword)
      end
      x = x+1
    end
    return noDup
  end
function mainCodeNew(it, timesToGo)
    if amount_of_links_enabled then
      timesToGo = useStringCode(amountToLink[counter])
    end
    print('Looking for all instances of [' .. checkSpace(toBeLinked[it]) .. '] to give [' .. hyperLinkToGive[it] .. "]")
    if tonumber(timesToGo) and textToRead[1]:match(toBeLinked[it]) then
      if textToRead[1]:match(toBeLinked[it]) then
        local toGive = ' <a' .. newTabText .. ' href="' .. hyperLinkToGive[it] .. '">' .. checkSpace(toBeLinked[it], " ", "") .. '</a> '
        x = string.gsub(textToRead[1], toBeLinked[it], toGive, timesToGo)
        --x = gisub(textToRead[1], toBeLinked[it], toGive, timesToGo)
        numberOfLinks=numberOfLinks+1
        textToRead[1] = x
      end
    elseif textToRead[1]:match(toBeLinked[it]) then
      allInstances = {}
      for j=1, string.len(textToRead[1]) do
        local c = textToRead[1]:sub(j, j+(string.len(toBeLinked[it])-3))
        if c == string.gsub(toBeLinked[it], " ", "") then
          table.insert(allInstances, #allInstances+1, {j, j+(string.len(toBeLinked[it])-2)})
          wordLookingAt = string.sub(textToRead[1], j, j+(string.len(toBeLinked[it])-2))
        end
    end
    for i=1, #allInstances do print(allInstances[i][1], allInstances[i][2]) end
      print("*Word [" .. wordLookingAt .. "] is being partially linked (" .. string.gsub(tostring(timesToGo[1]), "0", "") .. ":10)")
      print("*Found " .. #allInstances .. " instances of [" .. wordLookingAt .. "]") 
      newNum = tonumber(timesToGo[1])
      if newNum < 10 then
        markTable = {}
        local mynum = math.floor(100/(timesToGo[1]*10))
        switchbool = false
        if newNum > 5 then mynum = 10-mynum switchbool = true end
        for i=1, #allInstances do
          if i % mynum == 0 then
            if not switchbool then
              table.insert(markTable, #markTable+1, true)
            else
              table.insert(markTable, #markTable+1, false)
            end
          else
            if not switchbool then
              table.insert(markTable, #markTable+1, false)
            else
              table.insert(markTable, #markTable+1, true)
            end
          end
        end
        local fstrcp = textToRead[1]
        finalStr = string.sub(textToRead[1], 1, allInstances[1][1]-1)
        timesLinked = 0
        countera = 1
        counterb = 1
        counterc = 1
        counterd = 1
        for i=1, (#allInstances*2)-1 do
          if i % 2 == 0 then
            finalStr = finalStr .. string.sub(textToRead[1], allInstances[countera][2]+1, allInstances[counterb][1]-1)
            countera=countera+1
          else -- this goes first...
            if i == (#allInstances*2)-1 then
              if markTable[counterb] then
                local toGiveA = '<a' .. newTabText .. ' href="'
                local toGiveB = '">'
                local toGiveC = '</a>'
                local wordGiving = string.sub(textToRead[1], allInstances[countera][1], allInstances[counterb][2])
                --local finalWords = string.sub(textToRead[1], allInstances[counterb][2]+1, string.len(fstrcp))
                --print("FINALWORDS", "-->", FINALWORDS)
                finalStr = finalStr .. toGiveA .. hyperLinkToGive[it] .. toGiveB .. wordGiving .. toGiveC
                timesLinked=timesLinked+1
              else
                finalStr = finalStr .. string.sub(textToRead[1], allInstances[countera][1], allInstances[counterb][2])
              end
            else
              if markTable[counterb] then
                local toGiveA = '<a' .. newTabText .. ' href="'
                local toGiveB = '">'
                local toGiveC = '</a>'
                local wordGiving = string.sub(textToRead[1], allInstances[countera][1], allInstances[counterb][2])
                finalStr = finalStr .. toGiveA .. hyperLinkToGive[it] .. toGiveB .. wordGiving .. toGiveC
                timesLinked=timesLinked+1
              else
                finalStr = finalStr .. string.sub(textToRead[1], allInstances[countera][1], allInstances[counterb][2])
              end
            counterb=counterb+1
            end
          end
        end
    end
    if timesLinked~=1 and not go_FAST then print("*Word [" .. wordLookingAt .. "] was linked " .. timesLinked .. " times") else print("*Word [" .. wordLookingAt .. "] was linked " .. timesLinked .. " time") end
    textToRead[1] = finalStr
    end
  end
function getCaseCodes()
    for i=1, string.len(textToRead[1]) do
      local chr = string.sub(textToRead[1], i, i)
      if chr:match("%w") then
        if isUpper(chr) then caseStorage=caseStorage.."u" else caseStorage=caseStorage.."l" end
      end
    end
  --textToRead[1] = string.lower(textToRead[1])
  end
function workWithToChange()
  toChange = string.gsub(toChange, ";", " ;")
  toChange = string.gsub(toChange, "%-", "DASHCHR")
  toChange = string.gsub(toChange, "%:", "COLNCHR")
  toChange = string.gsub(toChange, "%https://", "")
  toChange = string.gsub(toChange, "%http://", "")
  toChange = string.gsub(toChange, "%/", "FSCHR")
  
  for word in string.gmatch(webe, "%.%a+") do
    table.insert(webExtentions, #webExtentions+1, word) 
  end
  for i=1, #webExtentions do
    local stringA = "%" .. webExtentions[i] .. "/"
    local stringB = webExtentions[i]
    toChange = string.gsub(toChange, stringA, stringB)
  end
  if amount_of_links_enabled then
    for word in string.gmatch(toChange, "%,%*%d+") do
      local newWord = string.gsub(word, ",**", "")
      table.insert(amountToLink, #amountToLink+1, newWord)
    end
  end
  toChange = string.gsub(toChange, "%[", " ")
  toChange = string.gsub(toChange, "%]", "")
  toChange = string.gsub(toChange, " ", "SPCE")
  
  --[[
  local tryToCheck = toChange:match("%,%*%d+")
  tempToChange = string.gsub(toChange, "%,%*%d+", "")
  if tryToCheck then
    if tempToChange:match("%d+") then
      --toChange = cleanOutURLNumbers(toChange)
    end
  else
    if tempToChange:match("%d+") then
      --toChange = cleanOutURLNumbers(toChange)
    end
  end
  ]]--
  for word in string.gmatch(toChange, "%w+%;") do
    newWord = string.gsub(word, " ", "")
    newWord = string.gsub(word, ";", "")
    table.insert(toBeLinked, #toBeLinked+1, newWord) 
  end
  for i=1, #toBeLinked do
    newstr = string.gsub(toBeLinked[i], "%SPCE", " ")
    toBeLinked[i] = newstr
  end
  
  toChange = string.gsub(toChange, "%.", "ZZZ")
  for word in string.gmatch(toChange, "%w+%,") do
    newLink = string.gsub(word, "ZZZ", ".")
    newWord = string.gsub(newLink, ",", "")
    table.insert(hyperLinkToGive, #hyperLinkToGive+1, newWord) 
  end
end
function addTarget(mytotalText)
  newtext2=""
  indexer2=""
  
  for i=1, string.len(mytotalText) do
    local nletter = string.sub(mytotalText, i, i)
    indexer2=indexer2..nletter
    if string.len(indexer2) > 2 then
      if indexer:sub(string.len(indexer)-2, string.len(indexer)) == "<a " then
        
      end
    end
  end

  return mytotalText
end
function addHTTP(totalText)
  newtext=""
  indexer=""
  needsL=true
  willBeS=false
  waitLetters = 0
  for i=1, string.len(totalText) do
    local nletter = string.sub(totalText, i, i)
    indexer=indexer..nletter
    if string.len(indexer)>4 then
      if indexer:sub(string.len(indexer)-4, string.len(indexer)) == 'ref="' then
        local Stest = totalText:sub(i-5, i+3)
        if Stest == 'href="isS' then willBeS = true end
        if willBeS then
          newtext=newtext..'"https://www.'
          waitLetters=4
        else
          newtext=newtext..'"http://www.'
        end
        needsL = false
        willBeS = false
      end
    end
    if waitLetters == 0 then
      if needsL then newtext=newtext..nletter end
    else waitLetters=waitLetters-1 end
    needsL=true
  end
  return newtext
end
function seperateOutput(final)
    function clean(mystr)
      cleanstr = string.sub(mystr, 3, string.len(mystr)-2)
      return cleanstr
    end
    cpOfFinal = final
    sepTag = string.match(textToRead[1], "%$%$.+%$%$")
    local locations = {}
    local labels = {}
    local allTexts = {}
    local i=0
    while true do
      i = string.find(cpOfFinal, "%$%$.+%$%$", i+1)
      if i == nil then break end
      table.insert(locations, #locations+1, i)
    end
    locCount = 0
    mainString = ""
    for j=1, (#locations+1)/2 do
      if j < (#locations+1)/2 then
        table.insert(labels, #labels+1, clean(string.sub(cpOfFinal, locations[(j*2)-1], locations[j*2]+1)))
        table.insert(allTexts, #allTexts+1, string.sub(cpOfFinal, locations[j*2]+2, locations[(j*2)+1]-1))
      else
        cpOfFinal=string.sub(cpOfFinal, locations[#locations], string.len(cpOfFinal))
        local finalLabel = string.match(cpOfFinal, "%$%$.+%$%$")
        local finalText = string.sub(cpOfFinal, string.len(finalLabel), string.len(cpOfFinal))
        table.insert(labels, #labels+1, clean(finalLabel))
        table.insert(allTexts, #allTexts+1, string.sub(finalText, 2, string.len(finalText)))
      end
    end
    print(string.sub(final, 1, locations[1]-1))
    for k=1, #allTexts do print("\n--- "..string.upper(labels[k]).." ---") print(allTexts[k]) end
  end
function finishOutput()
    y = ""
    print("========================")
    print()
    print('======== OUTPUT ========')
    cutOff = false
    
    if string.sub(textToRead[1], -1*string.len(textToRead[1]), -1*string.len(textToRead[1])) == " " then
      textToRead[1] = string.gsub(textToRead[1], " ", "", 1)
      cutOff = true
    end
    
    y = string.gsub(textToRead[1], "DQM", '"')
    if not cutOff then y = string.gsub(textToRead[1], "> ", ">", 1) end
    y = string.gsub(y, "DASHCHR", "-")
    y = string.gsub(y, "COLNCHR", ":")
    y = string.gsub(y, "FSCHR", "/")
    y = string.gsub(y, "NUMMzeroNUMM", 0)
    y = string.gsub(y, "NUMMoneNUMM", 1)
    y = string.gsub(y, "NUMMtwoNUMM", 2)
    y = string.gsub(y, "NUMMthreeNUMM", 3)
    y = string.gsub(y, "NUMMfourNUMM", 4)
    y = string.gsub(y, "NUMMfiveNUMM", 5)
    y = string.gsub(y, "NUMMsixNUMM", 6)
    y = string.gsub(y, "NUMMsevenNUMM", 7)
    y = string.gsub(y, "NUMMeightNUMM", 8)
    y = string.gsub(y, "NUMMnineNUMM", 9)
    
    gotoSep=false
    for j=1, string.len(y) do
      local c = textToRead[1]:sub(j, j+1)
      if c == "$$" then gotoSep=true end
    end
    
    y=fixPunctuation(y)
    if y:sub(1, 1)=="<" then y=string.gsub(y, " ", "", 1) end
    y=addHTTP(y)
    y=addTarget(y)
    y=fixSpace(y)
    finaloutput=""
    if gotoSep == true then finaloutput = seperateOutput(y) else finaloutput = "none" end
    if finaloutput=='none' then y=string.gsub(y, "%s%s", "") y=string.gsub(y, "%s%s%s", "") print(y) end
    allLinks = string.gsub(y, "href", "href")
    print("========================\n")
    print('=== FINAL NOTES ========')
    print("Links now embedded         |", numberOfLinks) -- SHOULD BE links now embeded
    if string.format("%9f", os.clock() - myclock) == " 0.000000" then
      print("Elapsed time (seconds)     "..string.format("|  ~%9s", "Instant"))
    else
      print("Elapsed time (seconds)     "..string.format("|  ~%9f", os.clock() - myclock))
    end
    local l = string.len(y)-string.len(cpOfOriginal)
    print(string.format("Total characters added     |%12d", l))
    print('========================\n')
    print("For more information type help() next to the arrow below.")
    
    if i_would_like_to_view_help then
      print()
      print("----> Tip: to select all text ABOVE click 3 times rapidly; press CTRL-C to copy")
      print("----> This will highlight all text black and underlined, when you CTRL-V (paste) in Word")
      print("----> a little rectangle with a clipboard icon will be at the end of the text")
      print('----> click on the down arrow of that rectangle, hover over the options and select the one that reads "Keep text only (T)"')
      print("----> To remove the underlined text just select all text and press the underlined button in Word")
      print("*Remember to use the Word find and replace if you have any DQM and/or RRR")
    end
    
  end
-- Main functions --
function tagtext()
-- 656879
  textToRead[1] = fixUpTags()
  getCaseCodes()
  punctuation()
  if textToRead and toChange then
    tocontinue = false
    dupvars = checkDup()
    if dupvars==true then tocontinue = true end
      if not (tostring(textToRead[1]) == nil) then
        
      if not (tocontinue==true) then
        userIsGoingOn = "waiting"
        print("The phrase/word [" .. dupvars[3] .. "] in your toChange section around positions [" .. dupvars[2] .. "] and [" .. dupvars[4].. "] are you sure that you would like to continue even with unstable results? (yes/no)\n")
        while userIsGoingOn == "waiting" do
          userChoice=io.read()
          if userChoice == "no" or userChoice == "n" then
            userIsGoingOn = "no"
          elseif userChoice == "yes" or userChoice == "y" then
            userIsGoingOn = "yes"
          else
            print("Please type either yes or no then press enter...")
          end
        end
      end
      
      if userIsGoingOn == "no" then print('exiting...') return end
      print()
      
      if (toChange:match("%,%*%d+")) then
        amount_of_links_enabled = true
        toChange = string.gsub(toChange, "%,%[", ",*00")
      else
        amount_of_links_enabled = false
      end
        
      textToRead[1] =" " .. textToRead[1]
        
      local x = string.sub(toChange, string.len(toChange), string.len(toChange)) if x=="]" or x==" " then toChange = toChange .. ",*00" end
      webe = website_extentions_you_use_link
        
      myclock = os.clock()
      if string.len(textToRead[1]) > 5000 and string.len(textToRead[1]) < 999999 then
        print('TagText is running.')
        print('We will be done soon...')
      end
      print("Length of text is " .. string.len(textToRead[1])-1 .. " characters.")
      if not go_FAST then
        print("=== Text Information ===")
        print("  working...\n")
          
        for w in cpOfOriginal:gmatch("%w+") do drword=string.gsub(w, " ", "") indivWord = makeIndividuals(drword) end
        for w in cpOfOriginal:gmatch("%w+") do totalWords=totalWords+1 end
        for w in cpOfOriginal:gmatch("%w+") do otherw=string.gsub(w, " ", "") table.insert(myRepeatTable, #myRepeatTable+1, otherw) end
        for w in cpOfOriginal:gmatch("%w+") do myRepeatString=myRepeatString..w end
        allRepeatedWords = checkRepeatCount()
        for i=1, #myRepeatTable do
          didR = checkForRepeat(myRepeatTable[i])
          if didR then
            wordsThatRepeat=wordsThatRepeat+1
          end
        end
          
        if tonumber(wordsThatRepeat)~=1 then print("There are " .. wordsThatRepeat .. " words that occur only one time.") else
          print("There is " .. wordsThatRepeat .. " word that occurs only one time.")
        end
        if tonumber(allRepeatedWords)~=1 then print("There are " .. allRepeatedWords .. " words that occur more than once.") else
          print("There is " .. allRepeatedWords .. " word that occurs more than once.")
        end
        print("========================")
        print()
      else
        print("Skipping some extra information to run faster...")
      end
      print('=== Running Logs =======')
        
      workWithToChange() -- Parses toChange and gets hyperLinkToGive and toBeLinked
        
      for it=1, #toBeLinked do
        if hyperLinkToGive[it] then
          if not firstTime then
            if amount_of_links_enabled then
              timesToGo = useStringCode(amountToLink[counter])
            end
            mainCodeNew(it, timesToGo)
            counter=counter+1
            canRun = true
          else
            mainCodeNew(it, timesToGo)
            counter=counter+1
            firstTime = false
          end
          local smallstr = tostring((it/#toBeLinked)*100)
          print(string.sub(smallstr, 1, 5).."%")
          if not go_FAST then if string.sub(smallstr, 1, 5).."%" == "100%" then print ("Generating HTML source..") wait(0.1) end end
        else
          print("**Error** Looks like your toChange is formated incorrectly OR you don't have all the web extentions that you listed.")
          canRun = false
          break
        end
      end
      
      if canRun then finishOutput() end
    
    else
      if noDup==true then 
        print("**Error** Looks like something went wrong with textToRead")
      else
        print("**Error** Looks like somewhere around [position " .. noDup[2] .. "] the phrase/word was [" .. noDup[3] .. "] was duplicated again on line [position " .. noDup[4] .. "]")
      end
    end
  else
    print("**Error** Looks like you are missing textToRead and/or toChange")
  end
end
function help()
    userOption = ""
    while userOption ~= "exit" do
      print("If you need any help please type one of the following numbers then enter")
      print("1 - Show me all words that are in my text that were hyperlinked.")
      print("2 - Tell me about the purpose of this program/script.")
      print("3 - How does this program/script work?")
      print("4 - Show me my original text compared to my new text.")
      print("(if you are done type: exit)-->")
      
      userOption = io.read()
      if string.gsub(userOption, " ", "") ~= "" then
        print()
        if string.gsub(userOption, " ", "") == "1" then
          print("Alright, you hyperlinked the words : ")
          for i=1, #toBeLinked do
            print(toBeLinked[i])
          end
        elseif string.gsub(userOption, " ", "") == "2" then
          print("The purpose of the lua program/script is to look at source HTML (or text) and add standard HTML hyperlinks throughout the original source HTML (or text) to make a massive (any size really) linked so that the reader can be easily be linked with other sources relating to this text.")
        elseif string.gsub(userOption, " ", "") == "3" then
            print("In very basic terms, after the user has added their input (to be linked and text to read through), the script goes through the user input, and simply adds the hyperlinks where they are needed then outs the new source HTML (or text) with the standard HTML hyperlinks.")
        elseif string.gsub(userOption, " ", "") == "4" then
          print("ORIGINAL TEXT: \n" .. cpOfOriginal)
          print("NEW TEXT: \n" .. y)
        elseif string.gsub(userOption, " ", "") == "5" then
        
        elseif string.gsub(userOption, " ", "") == "6" then
        
        elseif string.gsub(userOption, " ", "") == "7" then
        
        elseif string.gsub(userOption, " ", "") == "8" then
          
        end
      end
    print()
    print('press enter to continue...')
    userWait = io.read()
    print()
    end
  end
-- Create variables
createVars()
-- Start TagText
tagtext()
else
function wait(seconds)
  -- I did not make this wait function.
  local start = os.time()
  repeat until os.time() > start + seconds
end
local sym = "**************************************************"
print(sym..'\n\nLooks like the program is currently NOT STABLE!')
print('The program will be STABLE soon!')
wait(2)
print('You can use a different version with this URL: https://repl.it/JgVa/<version number>')
print('The <version number> being the version that you would like to go back and visit.\n\n'..sym)
wait(4)
print('----- Stable versions are in the UpdateLogs -----')
print(updateLogs())
end
