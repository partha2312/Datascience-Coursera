library(shiny); 
library(stringr); 
library(tm)

ug <- readRDS("uni.RData"); bg <- readRDS("bi.RData"); tg <- readRDS("tri.RData"); qd <- readRDS("quadgram.RData")

names(bg)[names(bg) == 'word1'] <- 'w1'; names(bg)[names(bg) == 'word2'] <- 'w2';
names(tg)[names(tg) == 'word1'] <- 'w1'; names(tg)[names(tg) == 'word2'] <- 'w2'; names(tg)[names(tg) == 'word3'] <- 'w3';
names(qd)[names(qd) == 'word1'] <- 'w1'; names(qd)[names(qd) == 'word2'] <- 'w2'; names(qd)[names(qd) == 'word3'] <- 'w3';
names(qd)[names(qd) == 'word4'] <- 'w4';

result <- vector()

functionAppend <- function(result){
  listcommon <- head(ug$word, 3)
  i <- 1
  len <- length(result)
  while (len < 3) {
    result <- append(result, listcommon[i])
    i = i + 1
    len = len + 1
  }
  result
}

predictWord <- function(the_word) {
  word_add <- stripWhitespace(removeNumbers(removePunctuation(tolower(the_word),preserve_intra_word_dashes = TRUE)))
  the_word <- strsplit(word_add, " ")[[1]]
  n <- length(the_word)
  if (n == 1) {
    the_word <- as.character(tail(the_word,1)); 
    functionBigram(the_word)
    }
  else if (n == 2) {
    the_word <- as.character(tail(the_word,2)); 
    functionTrigram(the_word)
    }
  else if (n >= 3) {
    the_word <- as.character(tail(the_word,3)); 
    functionQuadgram(the_word)
    }
}

functionBigram <- function(the_word) {
  if (identical(character(0),as.character(head(bg[bg$w1 == the_word[1], 2], 3)))) {
    result <- functionAppend(result)
  }
  else {
    result <- head(bg[bg$w1 == the_word[1],2], 3)
  }
  if(length(result) < 3) {return(functionAppend(result))}
  return(result)
}

functionTrigram <- function(the_word) {
  if (identical(character(0),as.character(head(tg[tg$w1 == the_word[1] & tg$w2 == the_word[2], 3], 3)))) {
    result <- predictWord(the_word[2])
  }
  else {
    result <- (head(tg[tg$w1 == the_word[1] & tg$w2 == the_word[2], 3], 3))
  }
  if(length(result) < 3) {return(functionBigram(tail(the_word,1)))}
  return(result)
}

functionQuadgram <- function(the_word) {
  if (identical(character(0),as.character(head(qd[qd$w1 == the_word[1] & qd$w2 == the_word[2] & qd$w3 == the_word[3], 4], 3)))) {
    result <- predictWord(paste(the_word[2],the_word[3],sep=" "))
  }
  else {
    result <- (head(qd[qd$w1 == the_word[1] & qd$w2 == the_word[2] & qd$w3 == the_word[3], 4], 3))
  }
  if(length(result) < 3) {return(functionTrigram(tail(the_word,2)))}
  return(result)
}

trim <- function( x ) {
  gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)
}

shinyServer(function(input, output, session) {
  p1 <- reactiveValues(x="")
  p2 <- reactiveValues(x="")
  p3 <- reactiveValues(x="")
  observe({
    if(input$inputText == ""){
      result <- functionBigram("xyz")
    }else{
      result <- predictWord(input$inputText)
    }
    updateActionButton(session, "prediction1", label = result[1])
    updateActionButton(session, "prediction2", label = result[2])
    updateActionButton(session, "prediction3", label = result[3])
    p1$x <- result[1]
    p2$x <- result[2]
    p3$x <- result[3]
  })
  
  observeEvent(input$prediction1,{
    updateTextInput(session, "inputText", value = paste(input$inputText,p1$x, sep = " "))
  });
  
  observeEvent(input$prediction2,{
    updateTextInput(session, "inputText", value = paste(input$inputText, p2$x, sep = " "))
  });
  
  observeEvent(input$prediction3,{
    updateTextInput(session, "inputText", value = paste(input$inputText, p3$x, sep = " "))
  });
  
  output$sentence1 <- renderText({input$inputText});
})
