
--[[

Information

Enter your text then find all of the
years that are mentioned in the text including
abbreviated years (EX '43).

You can also expand that area of the text to
discover more of what is around that section
also.

]]--

--- SETTINGS YOU CAN CHANGE ARE BELOW ---

-- You can change these year ranges to search for in the text
LOW_RANGE       = 1900
HIGH_RANGE      = 2017

-- If you see a '43, you are assuming that it is for the below year (so '43 means 1943)
COMMON_YEAR     = 1900

-- The checks that you want to preform; if you want to do the full years (1943) and the abbreviated years ('43)
-- I would use true for both of these in most cases...
CHECK_FULL_YEAR = true -- change to false to turn off the checking  change to true to turn on the checking
CHECK_ABRV_YEAR = true -- change to false to turn off the checking  change to true to turn on the checking

-- Characters that the search functions will show a preview of (when they show the years found)
PREVIEW         = 100
-- Characters that the expandA and expandB will expand by
TO_EXPAND       = 500

-- Enter the text that you want to find years here
text = 



-- Do not modify anything after this point ---------------------------------
text = [START OF TEXT]  .. text ..   [END OF TEXT]

FOUND_YEARS          = {}
FOUND_YEARS_EX       = {}
FOUND_YEARS_SHORT    = {}
FOUND_YEARS_SHORT_EX = {}

function expandA(num)
  print(nExpanding result  ( .. num .. A)nn)
  print(FOUND_YEARS_EX[num] .. n)
  print(If you would like to see more of one line again typennexpandA(number)nORnexpandB(number)nnThen press entern)
end

function expandB(num)
  print(nExpanding result  ( .. num .. B)nn)
  print(FOUND_YEARS_SHORT_EX[num] .. n)
  print(If you would like to see more of one line again typennexpandA(number)nORnexpandB(number)nnThen press entern)
end

local years = {}
for i=LOW_RANGE, HIGH_RANGE do
  table.insert(years, #years+1, i)
end

print(--nn---Searching for all years from ..LOW_RANGE.. to ..HIGH_RANGE..---nn--)
for i=1, string.len(text) do
  local num4 = string.sub(text, i, i+3)
  local testNum = tonumber(num4)
  if testNum then
    if testNum  HIGH_RANGE+1 and testNum  LOW_RANGE-1 then
      if string.len(tostring(testNum)) == 4 then
        local data = 
        data =  testNum ..  -n .. string.sub(text, i-PREVIEW, i-1) ..   .. string.sub(text, i, i+3) ..  .. string.sub(text, i+4, i+PREVIEW+3) .. n
        local data2 =  testNum ..  -n .. string.sub(text, i-TO_EXPAND, i-1) ..   .. string.sub(text, i, i+3) ..  .. string.sub(text, i+4, i+TO_EXPAND+3) .. n
        table.insert(FOUND_YEARS, #FOUND_YEARS+1, data)
        table.insert(FOUND_YEARS_EX, #FOUND_YEARS_EX+1, data2)
      end
    end
  end
end
for i=1, #FOUND_YEARS do
  print((..i..A) ..FOUND_YEARS[i])
end

print(--nn---Searching for all years from ..LOW_RANGE.. to ..HIGH_RANGE.. that are SHORT (EX '43)---nn--)
for i=1, string.len(text) do
  local num2 = string.sub(text, i, i+1)
  local apos = string.sub(text, i-1, i-1)
  local testNum = tonumber(num2)
  if testNum and (apos==' or apos==’ or apos==‘) then
    local bigYear = testNum+COMMON_YEAR
    if bigYear  HIGH_RANGE+1 and bigYear  LOW_RANGE-1 then
      if string.len(tostring(testNum)) == 2 then
        local data = 
        data = ' .. testNum ..  -n .. string.sub(text, i-PREVIEW, i-3) ..   .. string.sub(text, i-1, i+1) ..  .. string.sub(text, i+4, i+PREVIEW+3) .. n
        local data2 = ' .. testNum ..  -n .. string.sub(text, i-TO_EXPAND, i-3) ..   .. string.sub(text, i-1, i+1) ..  .. string.sub(text, i+4, i+TO_EXPAND+3) .. n
        table.insert(FOUND_YEARS_SHORT, #FOUND_YEARS_SHORT+1, data)
        table.insert(FOUND_YEARS_SHORT_EX, #FOUND_YEARS_SHORT_EX+1, data2)
      end
    end
  end
end
for i=1, #FOUND_YEARS_SHORT do
  print((..i..B) ..FOUND_YEARS_SHORT[i])
end

print(nnIf you would like to see more of one line typennexpandA(number)nORnexpandB(number)nnThen press enternn[If you want to change any settings you can at the TOP section of the left side]n)


