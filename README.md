# Artist_Analyzer

This app intends to create an easy way to analyze song information from artists/bands. 
This app uses data from Spotify's API to gather interesting variables from songs.
The Spotify song dataset is ~300 gb, so this app uses the $\texttt{spotifyr}$ package to collect subsets of the dataset.
This app focuses on three continuous variables (duration, loudness, and tempo) and two categorical variables (time signature and key signature).
* Duration is how long the song is (seconds)
* Loudness is the relative volume of a song (decibels from -60 to 0)
* Tempo is the speed of the song (beats per minute)
* Time signature is the number of beats in one measure
* Key Signature is the base pitch of the song
This app displays summary statistics and visualizations of the discography of an artist, and performs a linear regression on the past Grammy winners.

The $\texttt{spotifyr}$ package was created by Charlie Thompson, Josiah Parry, Donal Phipps, and Tom Wolff, and copywrited under the open source MIT license:
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
See more information about this application at https://www.rcharlie.com/spotifyr

library('Shiny')

shiny::runGitHub("Artist_Analyzer","ccorbet2")

https://ccorbet2.shinyapps.io/musicr/
