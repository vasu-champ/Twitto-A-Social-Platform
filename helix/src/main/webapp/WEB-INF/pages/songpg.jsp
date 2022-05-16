<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
html, body {
  background: rgb(244,212,227);
  background: -moz-linear-gradient(-45deg, rgba(244,212,227,1) 0%, rgba(124,165,186,1) 100%);
  background: -webkit-linear-gradient(-45deg, rgba(244,212,227,1) 0%,rgba(124,165,186,1) 100%);
  background: linear-gradient(135deg, rgba(244,212,227,1) 0%,rgba(124,165,186,1) 100%);

  min-height: 100%;
  margin: 0;
  padding: 0;
}

body {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: absolute;
  width: 100%;
}

i.reset-icon {
  align-self: flex-start;
  margin: 20px;
  font-size: 40px;
  color: white;
  transition: all 0.3s;

  &:hover {
    transform: rotate(-90deg);
    cursor: pointer;
  }
}

.search-box {
  opacity: 1;
  width: 60%;
  min-height: 100px;
  margin: auto;
  display: flex;
  transition: all 0.3s;
}

.lyricBox {
  border: none;
  width: 80%;
  font-family: "Raleway";
  font-size: 36px;
  padding-left: 40px;

  &:hover, &:active, &:focus {
    outline: none;
  }
}

.search {
  width: 20%;
  border: none;
  font-family: "Raleway";
  background: #4d4d4d;
  color: white;
  transition: all 0.3s;

  &:hover {
    background: #787878;
    cursor: pointer;
  }
}

i.search-icon {
  font-size: 60px;
}

.results {
  font-family: "Raleway";
  display: flex;
  flex-wrap: wrap;
  width: 60%;

  .container {
    color: #383838;
    display: flex;
    flex-direction: column;
    justify-content: center;
    box-sizing: border-box;
    width: calc(33% - 20px);
    margin: 10px;
    padding: 20px;
    background: rgba(255, 255, 255, 0.6);
    -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.5);
    -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.5);
    box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.5);
  }

  .title-container,
  .artist-container,
  .album-container {
    display: flex;
    align-items: center;
    margin: 0 auto;

    .title-icon,
    .artist-icon,
    .album-icon {
      margin-right: 10px;
    }

    .title {
      font-size: 24px;
      margin: 10px auto;
      text-align: center;
    }

    .artist,
    .album {
      font-size: 16px;
      text-align: center;
      margin: 10px auto;
    }
  }
}
</style>
</head>
<body>
<img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAPEBAPEBAQEA8QFxcZFRAPDxUQDxUVFRYXFhYYFhUYHSggGBooGxYXIjIhJSkrLi4uFyAzOjMsNygtLisBCgoKDg0OGxAQGy0lICUtLS0tLS0tLS0tLS8tLS8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIAM8A9AMBEQACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABAYBAwUCB//EAE8QAAEDAgIFBgcLCAoCAwAAAAEAAgMEERIhBQYxQVETIjJhcYEUI3KRobHRBxZCUlNUc5SzwdIVJDM0kpOy0zVDYmOClbTCw/CDxSUmRf/EABsBAQACAwEBAAAAAAAAAAAAAAABAgMEBQYH/8QAPBEAAgECAwQGBwcEAgMAAAAAAAECAxEEEjEFIUFRExQyYXGhIjNSgZGx4QYVU2KSwfAjNELRgrIkcvH/2gAMAwEAAhEDEQA/ALouwcIIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIDm1j2N8KllE8jYI4nNjgnkiNnukBNmOG9uZOwBcDalfERxFOlSnlzHXwNOm6TlKN7M0w1dI6Sji5GvDqxmNpNXUWYOdkfG59HMjYC071zpV8dGFSXTL0Hbx8DcVKhdLJqT9H9F4BcQyWVoL3F7rMlcwAuOZ2bTmvS4Cc54eEpu7aOLi4xjWko6ElbZrBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQHLqaGrmqHNpKgUz8MBc5zcQLQ+oHA3sXA2yva1wuHtZ0Y1IOrHNdNLufM62z8zhLK7byw600VVPEG0dQKaTlMbnkXuy1rbDsc8Otvw23rhUpUabk6scyd3b4W+Z0XmdsrscfRg8WSdrpJnX8uZ7vvXsMGrYeC7l8jz+Kd60vElrZMAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEAQBAEBD0g23JytL2SNkiAdHI+MlrpowWuwkYm5nI3C18TShON5JO2lzZwtSUZ2T1K7HpGoe6BjqiowvhjxWqJGkkzaLBN2uBvaR+f9t3ErQhh6UppOKt4HSqzlGDaZa4ogxoY0Wa0WA4ALrJJKyOK227s9qSAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAE2zOwIDDXAi4zCBO4c8DaQO1A3Y8VDiGkjIqVqRJ2R5im6LTe5F77lLRClojFS8gssdpz9CJESelj06oaATmcJsclFmS5ohaRkJLRfLlKfL/wA8Sx1l/SZmwz/rr+cCr0559L9HF9todaNP1iOrW7DLnSvJxXN7FdOSOHBtm4PF7XFxuVS9zKA8seHC4NwjViE0z0hIQBAEAQBAEAQBAEAQBAEAQBAEAQBAR5Zc3t3BpN+5WS4lJS1R7pOg3/u8qJakw7JEe4lmZvzt/YrpbzE3de8kVEoIe3O49qqlvMkmmmjUzpM8j7ircCi1XgeGdGPyvYnMhaIP2S+UPWUXAPRmrSBzZ5dP9tGsNf1TNrCevXh+xV4Tz6TyIfttDrQp9tHXq9h+BcaeUNDib9Lcuo1c4EXZMPNnSkbbexOQerJEJuwE8FV6l46Eanlwtb1ut6lZq7KRlZE1UMoQBAEAQBAEAQBAEAQBAEAQHiZ+FpPBSt7Ik7K5Hx3kYeLb+gq1txjv6SMSy4uTOznexErXDlexmplxNcLdEgelIqzEpXTPLuk7yPuCcCOPuNlPLYMbbpX9aNb2y0ZWSRGPQ/x/crcSnD3m2TbL3esKFwJerDekzyPuKcAtV4HhnRj8r2JzIWiD9kvlD1lOQejI+lDmzy4ftGFYcR6pm3hPXrwKzF+kpPIi+10OufDto61TsPwLY7oO8r7iutxPPcPebZOlL2exORL1ZthlsGNttbt8/sVWuJZS3JEZvRZ5XsVuJTgvE2xyYTKesesqGr2LJ2bZnH4wu/s3t3XS24m/pB8mJ0R2XJ9aWtchu7TN0EuK+VrGyq1YvGVzaoLBAEAQBAEAQBAEBrma4jmmxUq3EiSfAjTRvDTd9xwVk1cxyUrb2ag112554cuoWOStdFbO5hrTZueROXUckIs7IOabPz2HPrOabhZ7zJa65zzw59ltiXRNncNa7mZ7b26s03byEnuPNjhvfK+zr4pxG+x6c1133Ozb1puDT3gNddueZbl1CxyTcSk7ow1ps3Pacuo5IRZ7g5ps/PYc+s3KBp7yLpQEYLm/PjPdiBWDEerZt4NPp0VxnTprbeTj/i0QufDto69TsPwZbHA4TnlfZ1rr8TzlnY9Oa6788wM+vYl0TZ7w1rrszzIy6hml0EndHkNNm55XyHWgs7GXNdz89hz680DT3mcLr7c8N+62xLomzuYa13Mz23t1ZpuISe42U7Hm+F1s81DaLRUuBJhY8E4nXCq2uBkinxNyqWCAIAgCAIAgCAIDzIzEC3ipTsQ1dWNHIkPbkbBtr27VN9xTK8yEsBGANBIB4X4KUxKNrWM1MFmusDdxF9+9QnvJnHduNbgcTsvgfcFK0KvV+BtportYbG4vbzlRJ7y0Y7kyKRzP8f3K3Ex8PebJBnL3esJyJfEMHOZ5H3FOBK1XgeGDmx+V7E5lVojLxlL5Q9ZTkGtzImmfg9rPRmsGI9Wzcwnr14Fai/SU/wBG3/1JWhDto61TsvwLc/oO8r7iutxPO8PebJOlL2exFwJerN0MYIa7eB/31qre+xeKVkyK3os8r2K3ExrReJvjiuZAQbE9m8qG9C6jdu5nk+ecjhw2v3cVF9wy+kYfFZ0YAJAPbvUp6hxs1Y3QxYb53ubqrdy8Y2NigkIAgCAIAgCAIAgCA42t4/M3jcXwA9hqIgVWegu0m1yfyK5PoljY2SYWHHuw7LgkZ9ywrWxqSnVjBSzPeRfBY/iN/ZCmxi6xV9pmuZkDOmI23+NYX7E3GSnLEVHaGZvuuzTytL/d9pbYechRdGy8LtBK7hP4MkRwQuF2tjI4tAI9CncakqtaLs20evBI/k2fshCvT1PaZh1NENrG52GTbkk5AADMkncobUVdloVK03li22PBI7lpiwubtbJEY3i+y7XAEKsJwmrwd13F6rxFJ2ndMz4JH8mz9kK5i6ep7TIlRTsDjZjfMhkjWqW1Z0dCSt5FzBc2md0WktbaIHMjJuYO1UqVIZMl9/LidXCQm5xm07W1MNNnwnPKK9gCTk3RRyAzJ6gtZNRkmzpyTaaRcaGaOTGy/OBuY3AskA3EsdZw7wulGtCorwkn4HDdGcLqasbHNJfIBtI9iycEYrXbJMTSGgHaAq8TIlZEamixNGdrOv6lZuzMcY3RMVDKEAQBAEAQBAEAQBAEAQBAEBxtbv1R/wBJB/qIlWegfZfg/kc2u/Voe1v8JWBamrV9TE4gDpSQ0lrBkZBbESNoZfLLee7srOpl3I7uxdgdZSrV90OC5/Q58sLYXEG2I7zcvd132lYbtn0OhSw+Hgo00o9yMZnMEjtbl6RdQbHpS0dvcSIqcMbjeMBOfLxZFvDGDu7bjjZSpNPccXaGCoYlONeC/wDZar+fAlRvIOB9sVrgjovHEcN1x1rYhNSR892tsmpgZ84PR/7JdDUmGaGcNDzE7FgJsHAtcw57jZxI6wFgxmH6xRlTva5qYHErD1lNq6FVpR9XyMr24S2Jrbk3e83Li5xGW05DdnxsMOz8F1ZSV9XfwNnauMjXkoxXZIHh8Pysf7Y9q37o1FgcS1dU5fBnc1S1fbXyOmecVLGbANOUrwASC4fAFxe20m2wEHi7Ux8qbVGl2nx5L/Z2Nm7Oss9dacGWnWqFsdMyNjWsY1xAawBrQBFKbADIDJcTZmZ4v0nd2Z3K1sm4otL+lg+i/wBmiSvR1/Vy8GasdUfUK+hjnGGRodbNrtj2Hix4zaesLxlDEVKElKm7M35wjNWkjhUb3tc+GU4pI7ESWA5RhuGuIGQdcEEDeL2AIC93s3HrF0c3Fbmjz2OwnV6llo9CWuiaRgADYLdiAygCAIAgCAIAgCAIAgCAIAgCA42t36o/6SD/AFESrPQPsvwfyKrpKufyTY75XDW2tcXvc9obiI7FgluVyNlYaWNxMKD01fgjDapuANite+FjTusNpHAAE93WtR959RkujiowXcuX8Rup9EundyMLTJORidI42AGzFI74Lb5AAcbDIrDXxNOhHNN/Uxyrwwve35nUfqHVNGISwSHfHz2doDze57QO5c2O26TdnFrvMK2tO++C+P0Oe5+HEHgxuYbPY8Wc1w3EdhGzIggi4IXVhNTSlF3TNylUjWjeJw6iUjmR5NYccQO4ja3qbna3BxG5Zouzua2M2fCvRnh5cVePczqQyB7WuGxwBHYc1tI+Rzg4ScXqjVo/9FH5I9SLQvX9YzmMMdhhbUYd1nstbvcsTyXPZ4eG3uhj0cllsrdnS27gfXtQ4gzR1OWg86PHnmbyEyG/Xdy8hipXxNWXLcbF6jS6R3lx8eJH1yNoG+U//TzKmyN+J9zIr9godObSw/RH7LRRXpq3q5eDNSOqPrZXhTolbrhaogfvPKs7iA/1xjzr0P2bm1XnHg1fzNPbEV0MX3klexPNhAEAQBAEAQBAEAQBAEAQBAEAQHG1u/VH/SQf6iJVnoRLsvwfyKTpHpxDdzj32A9RK1quh2Pscl12T/K/miJBmGO/s+k2PtWA+h0ldRl3ebsfS/c8YBRuk6Ukkj8VznzOYxtzsGEA/wCInevLbYk3icr0SXmeexr/AK8ymaka76SqtKNp5iHRyGQSQckG8gGtcciBiFnANOIm9+JC3sds/DU8LnjqtHfU5lOrJzszs+6TE1tTTuHSkjfj6+Tc3Ae3nuF+rqTYcm6ck9Ezv7JbzyXcio7SDwJ+8Ltna7TT5MnaL/RN6i4dwe4D0Lajoj43tZJY2ql7T+Z60f8Aoo/JHqUrQ06/rGcrlb5mniB4GneT58OaxuXcelpbNw8qcZPGJNpbuXdqfU/c6ri+gazIGFz4yA0tAAOJgAOY5j2juXjtqp0sTO3+W861KMFFRjPMluzLicXXfT+KobRMAwsEpkeduPwSdwa3sBBJ6wNxW/sfAOMOsyeu5L9zFXq+lkRWKmYs54IBZTykE5gFtNoxwv1ZLsOKl6L47jXvbefTdXtNisp+WsGyNJbIwG4a8AHI8CC0jqcN68ftDBywlZ03pwfNHQoTVRJkGQ46kD4MEefAvlOXeGsP7wLufZvD7p1n4L9zR2zV7NP3m+WoYy2N7G32YnBt/OvU3OCk3oa/Doflov3jfaouicr5Dw6H5aL9432pdDLLkPDoflov3jfal0MsuQ8Oh+Wi/eN9qXQyvkZbWREgCWMk7AJGkk9Qul0Mr5G9SVCAIAgCAIAgCAIAgKxrXpiB0EkLXl0rZIrtbHIehPG52YbbINPmVJb1uMnQzcXZap/IqWkKpjgwtxktcDYRSZggtPweu/csU4trQ29gSqYPGKdRWi00zRRyNza7G0AmxMUmYOYtzeu3csDpz5HvKe1MLCLjnW57vAsugNZo6FzsIkkgkzfG2J4eHAWxsu2xJAALSRewsRax5mP2ZLEpNK0l5nMxmIw9SXSQmr8UWOTX/R7QXsbUPkd8FtHKx54Xc5oHpXHjsXGyeWS3eO40FXpviVDS2mmVL3zyhznkANjZHJZjW3wsa4tF8ySSdpcdgsB6HC4J4enkin3951cNjMPh4N502/5Y5cj2MZdrnPIBJHIyAk7Tbm8VtKnPkbsNrYaMN8lc3U1ZHHG1pxksbnaKS5Ns7c3eVsJNLQ+X18PXrVpVGu02/izNJWMbGxpLrhoB8VJa9s/gqUnyKVcJWlNtRN3h8fF/7qT8KWfIx9SreyWbUzT1JTwzcrMWOllLg10MtwGsZGL83fgJ7CF5na+CxOIrp04NpK37np9mWo4dRm95UtLysm0jJJE4vZ+duDsLmgtfSSOuMQGw83uXYwtOcMJCElZrVFptdI2uJ6r4y9rmNF3OppwB1+B6NVoq8kkG7IufudUrmUczzfDI8Bp+MI2taXftBw/wrzn2hqxniFFf4qzNzAxaV3xZPjcGVEzHZGTDI0nK4DWxuA7C1pP0gXV+ztWLwzhxT+ZztsU5dKpcGio66UUNTpPRcEzQ+J4nDm4i29m4hm0gjMBdqaTkjToSlCnJrU6HvA0T82H1ib8atkgU6zW5+Rn3gaJ+bD6xN+NMkB1mtz8h7wNE/Nh9Ym/GmSA6zW5+Q94Gifmw+sTfjTJAdZrc/I4WnNXaOiq9FOpohGX1LQ48o9+QLSOk422qsopNWM1OrOcJZuRdtJ6Zipy0PD3FwcfFgOs1paC5xJAAu4K8pqKuzTjBydjlN12pDYgTc61rsaL4gHDa7gQsfWIXsZnhZpZnax36OqbNGyVl8LxcXFj3hZk7mu1Y3KSAgCAIAgKFJpLSM1bNTUz3vLTIQwGFgDGSFu17d2W++a08TioYeOeo7K9js0cNSlCPo3bXMm+A6e+K/wDf0v4VoffeF9p/Ay9Sh7HmcXS2h6+nY+eoiLWPeMb+WhecTyTsaCRc8FsYfadKvLJTk7+BZ0YxtePmbdWtHsqDOJGPl5INw2mdDa8zmEnCRiuAAqbTxdWj0eSVr3vuuRTpRcpK2hZHarU95B4NJzZo2D8+lya5kRI6WfTOfX1LjrauJsn0nBvs/QzdXhyKPW2Y97b4Q10waDJbNjyGNL3bcuvOy9RTqSlQhJve0vkcrEXi/R58r7jRyw+M3oX/AFlnT+Lt/wC8Uzy5mtnqd+tuzw5nmSe2Gzmm7QT+cMycdozcNinPLmWhKbvdvX2eB58IPEfWI/xpnlzL3fN/pMGoPV9Yj/GmeXMXftP9J2NX6dk9VDC68sT5HAhspYXAQvdblGkHJw9C1sfXqUsLKcXZrjqbOEWdrOizRas05ijcaeS7qcyE+Gy5vAYcVsWW05bM1wfvTE5muk/yS0+hv9BC2hXNY6JsE7omMcxoaw4XSulN3NuTicSe5d/ZOInXoOU3d3fCxq14KM7JEjUmhZPXMjfityU9i12FwJiLLjccnHbcJtWtOjRU4a3/AGb/AGFCKlKzPow1TguC90j24HtLCWta4OigYcRa0HZENhG09VvPVdq13BpWW5u67lf9zajQjc6bIWtaGNaGsAsGtADQALAADYF5yTcndm4txW9YtDMrITE8NxtN43ubiDHi4BtvB2EcCVsYHFywtZVFpxXNGatSVWFj55SUFKWnl5OQma57XRCgMoaWPLemHAO2X2b17d4nEz9KhSUovendI4nRwjunJpm78m0Hzk/5W78ajp9ofgR/Uhlo+0x+TdH/ADk/5W78adPj/wACP6kMtH2mY/Juj/nR/wAsd+NOnx/4Ef1IZaPtMz+TKD5yf8rd+NOn2h+Av1IZaPtMwdH0ABPhLu7Rbj/vTpsf+BH9SGWj7TODQV0Yc90YwtIsS5scPNL2kYsZLNm4kjPsWerOTp3as+6//wBMUorpIrVb/kbpamINeW8iHuBzZJo/GSc/gHEc+GfDNaMM+Za+ZnnGLi9y8i8as6xQkU1EGzGXC4E8i8RtLedm4ixBB2jLzhdaM1uRyZ0nlzFrWQwBAEAQBAU3VH+nKjyKj7Zef29/bf8AJfueiwnZh4H0xeNN4qvumH/49w/vIv4l2NiP/wAm3c/kYay3LxRRtYdX2Q0NLWB2N85nJZJGxzW4S42abXXsqVSUpOPI0K0UpN95P1t1IgoamigY4PbUkBxfBFdodLHGbWHCQlKdaU4ybtuKSik0WWf3N4op6anbUyhkol/q4xh5MNIAAFvhLEsXO3Ano0cOv1WEWloNHCokMcoaTIWMxjEyV2WVv6secrKsRN03MrkV7Cj1WEml5tGmeQRxXtIGM5Q+KikzyttkI7lLrzVNTCgs1hqhqsK6prIHzyMbTOIa5jGXdaWSPO44MB71FSvOEYvmFBNtDUzVYV89ZC+okYKbDhLGMucT5mZ3HCMecpVxE4KL5hQTuS5dRIn0FZVOne40xrLRujjLHeCySsZiuN4jF+0rH1qd0txbo0jiUup8L9GT6QJaJIpMIYII8B50bbnK9+eVllVkqmQqopxuJdW2RaJi0g2Qh75C0xNjY2P9YMN8he9hftVoVpdI4DKrXJHuc/0jH9FN/AtLbn9t73/1Zkw3b/nM+uO2dx/havIT09z+SN+P8+JGXOMxBq22d2qrNim7xPmWuDaeKslMr8HKBjrGQsFy3CbAEX6HpXtth1W8Ik3o2jUrU6XSNzOYyJrm44JMY+KX42nqxG5ae/uXajUaME8LTmrwNFxflMEbm4QPGnDhIJvuOe7uWScc9mjTo1eibTVzBLZLBscAs5pxMcC4YXB25vUqqlvvuMtTFKUWstiRFGZCbHCxpsXDpEjaG3yAG89ytOo72RGGwudZpaGtr6QuwCYY72/WHXvw6ViepYc75m30VB+juIFPGRUTjHbC4HGXuYQAGXJLC0jaNhCw105Rf0/fcc7EZaNWN9Lv5dxLnnxNc0T4i4EBvhFWQ4kZAY5cJvfYbg34LQhSnmW7/r/ovOtFQbd/hIueo/8AX9kH2ZXWp8Tl1ezEtKymAIAgCAID5dpKWeGsnmp3SNkxzNvHkcPKONtm/wC5adejCrHLNXR6GhF9DBxvpwPM2stexzmuq5wRsvI0E84DhwJO/YtX7twv4a8zJJyTs2/IVFdW1AbFPLO+JxBIebtBBNjs6r96yUsFQpSzQgky2SUmr38iw65uA0Lo25Av4SBfK5OOwHWs1F2qS8Galbte8sHuoOA0hogEgEvZYE5n85p9nFUoP0J+BWWqLtpL9eofJqP4Y1rrQuUrTbx756NtxiLWEC+ZHJ1OdlsRf9B+JR9pDRTh76KttxexNr528Gphe3BTL1C8Qu0x7lrwdIaWAIJa91wDmD4TUbeCiv2IeAjqx7krgazS1iDYsBsdh5aqyPApiOzDwENWdr/8fSvlaV+3qVhXaXuLsq+jHg6uVrgQW8tfEDdthJDc34ZHzLYqP/yF7jGl6BH0gf8A61TdcziOseHGx9KvT9eyf8Ss6t1c0NUx8DHPk5OYBrIzKedE4NOEbg/AT1XU7RjRlStWdo31/ndcik5J+it5dpNYtIkZU045rxnRP6RijDN+zlBIT1Fq4To7MetXz93LkbGat7J1dUqysmjlNYwseH2ZeEwkswNN7Hbzi7NcTaNLDU6iWGldW8zaoym4+mjoVpzHYuazcpaHwj3SqwTaSmw5iJrI79bQS7zOcR3L2eyKThhY343ZzsVK9RkTU57uWe0XwFhLuFwRhPbt9K6sNRhr5i36B0TPVTzindEx1O+N+KU5XdmLDA4HnMde43rU2jjaVCkoVU2pX07rFJ0nKs3F6HW09q9pARvqqiSmkFPG42YcBwjnOsGwtBOW9aGz9p4WnU6OlGXpNLe7la1CcleTW4qGk3ObQEsuCWtxEbecRj9Zv3ruy0Nl7qKtyRS1hNM77YZBCJuUc1zg0nI4iea0c4EbbN2rLl9G7Mk4JwzS4by4u0dTyPo6eGB9NKAWSSPPLMc9sbSLNbMCB4t+fWBbhpYXDV41JOrJNPTuOfPH0aiywvdalt0Fog0okxSCR0mHox8kwNY3C0Btydm0k5rqRjY0alTNayOqrGMIAgCAID5vVH85qbbeUlt243LEz1OD9RHwINAyEse6SVzZeSxRBvOdLIXNuHM39Zyw8dxw4idaE6Soq6b3+Bz1aWZz1N2jdj2/Ba6wG4c0EgdVyVmlZS3HQwbbp7z6Po6tiGitHtLuc2pp7ixytWgndwWlKDzNmrPtM72sGkYTPowh98NU4nmuyHglUOHEhVVORU2aQ0lCa2hOPINqL8129rOpRklyBibSMP5ShdjFhSzC+E/KwdXamSVgaqXSEP5Vq3Y8jSUgBsd09bfd1hOjlyBv0ZpGEVdccYsTDuPyfYmSXIGvV3SEIl0kS8DFV3GR+bUw4cQVLhLkBqjpGEQSgvF/Cq07DsNXMRu4FHCXIGNXK+EaOjaXi+B+Vjxd1JklfQFO1sqmv0HRtbfmRUdzszLoPYtjDxaldlZaFf8Ac+/pCP6OT1Ban2i/tP8Akv3L4Ttn1ZeEOmaZKgDZmerYouXjTbKZrRrYyIPjgc2WpOVwbxxHi47MXBufXlt7OzNj1cTJTmrQ+fgY6+KhSWWOp8+qm0kwHKtc14Frvdhfxzdfn5k557V7Lo0lbQwZ6VRGylmghaWU7bk79ovxc/7laMORDrU6S9E6WrWsLqGWQRRieScRtIeS0lwe85HZcmXuWhtTAU8RGOaWXLfhfU1aNWabla9zrax66VBhkp6ilZAKiN7Q7lC82LbOIDb7Ab5rmYPZNDpFUp1W8rT0M1StNrK46laiq2sxNcC6N19jcVr7QRvaTc953L004b7orhsQlHJM576OixYmhvkmS4/Zv6FiUImVqlqjZOeUysWsGy4sSbZG24Dr39meZQvqa1espLLHQ+g0OgQyWgnM8ry+J8xa4RhuLBG22Tb28c7zDrvxtnY+eJrThJJZeXjY0cRgaWHhnhe7LIu0c8IAgCAICNUVWE2Az4nYrKNzHKdtxTavQk7pZHtMNnvc4Xe9p5zi7YGHjxVOiZ1qG1o06ag4vcRHasTkk4oxfbhmkAN9vwMu5OjmtBLadCTu4P4m6PQNS0BrTCANwkf+BR0UjKttU0rKDOvT01SIIYDLABE9rx4h7zdkvKgF3KC+eV7BR1d8zTltJOTaj5kuqdUyOheZYAYHl4Apn2JMb47Hx2yzye5Or9/kV+8fy+f0MyyVLpIpTJT3iDwB4M+xxgA38d1J1fv8h94/l8/oHPqTM2blafE1jmW8GfaznMcT+m28wedOr9/kPvH8vn9Dyw1InfUcrBifHHGW+DPwgRukcCPHbfGnzBOr9/kPvH8vn9D1DJUtklkElPeXDcGmfYYW4RbxydX7/IfeP5fP6GKR9TG6ZwlgPLSYzemfkcDGWHjtlmDzp1fv8h94/l8/oKB9TC0tEsBDnyPzpn7ZZHSEfptgLrJ1fv8AIfeP5fP6CjdUxRNhEsBa0EXNM++d/wC+606v3+Q+8fy+f0IdZRTy0jKMzQhjBEMQpn4zyRaR/XWzwjzq0aFne/kHtG/+Pn9CJorQMtPM2ZtSLtDhzIA087rc9wt3LHi8HDFU+jq6a7hDaUqbvCO/v3ndM9QdtQe6KO/pBXLX2cwf5viZvvzEcl8DS+AvylllmHB7w1h6iyMNa4doK3qGycJRd4wV+/f8zVq7TxNRWcreG4rjtUn3dhqI2tLnEN8GOQLiQMpBsvbYt5Ra3ErHJLfHz+hj3pSfOY/qzv5qmzJ68vZ8/oPelJ85j+rO/mpaQ68vZ8/oeXanvO2oiPbSk/8AKocW9bfAdeXs+f0MN1NcNk8I7KQj/kUKFtLfAdfXs+f0PfvSk+cx/VnfzVa0h16Ps+f0HvSk+cx/VnfzUtIdeXs+f0PLdVJASS+OUEC1+Ugta98gXXvceZUlCTepjqYrPbK3H4P/AETBomp5vjTzBZv57Uc1uWTeA5oyHAcFghhIwbcUk3yMUq85K0qkn7l/s7mh3SwxNjkdyjgXG7nuebOe5wGJ2ZsCBnwWxGFlvKSq3e47FPNjF7WUNWLxldGxQWCAIDy9gO0A9qXDSeppdRsPEdh9qtmZR00azQ8HecKc5XojwaJ3EelTnRHRs8mkfw9KZkR0cjyad/xSpzIjIzHIu+K7zJdEZWeSw8D5ipFmYseBQixhAEAQBAEAQBAEAQGUAwngfMgseuTd8U+YqLomzMiF/wAU+ZLoZXyPQpn/ABfSEzInJI9Ckf1edRmRPRs9CiO8j1qM6J6JnttEN7j3CyZy3RG1tKwbr9uajMyygjcAqlggCAIAgCAIAgCAIAgCAIAgFkBjCOAQWGEcB5kFkMI4DzILIYRwHmQWQwjgPMgshYcAgMoAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgCAIAgP/Z" alt="W3Schools.com" width="600" height="400">
<section>
<form>
<lable
<label for="name" ><center>Song Name</center></label>
    <input id="song-name" type="text" name="name" placeholder="Search Song OR Album"><br>
    <br>

     <p style="color:red" id="songerror"></p>
    <br>
    <br>
    <button type="button" id="btn-play">PLay Song</button>
    <br>
    <br>
    <button type="button" id="btn-Download">Download Song</button>

</form>
</section>
<script>

function SongFeatcher(){
    var name= $("#song-name").val();
    error="";
    if(!name){
    error+="Please enter the Song";
    }

    $("#songerror").html(error);

        if(error.length>0){
              return false;
            }
            return true;
       }
           $("#btn-download").click(function()
           {
               var isFormValid = SongFeatcher();
               if(isFormValid){

                var name= $("#SongFeatcher()").val();

                var user={
                "name": name
                  }

             $.ajax({
             type: "POST",
             url: "/songlist",
             data :JSON.stringify(user),
             success: function(){

                   alert("please enter the song");

                   },
             contentType:"application/json"
                   });
           }
           else{
                    $("#songerror").show();

               }
                   });


           $("#btn-play").click(function()
           {
               var isFormValid = SongFeatcher();
               if(isFormValid){

                var name= $("#SongFeatcher()").val();

                var user={
                "name": name
                  }

             $.ajax({
             type: "POST",
             url: "/songlist",
             data :JSON.stringify(user),
             success: function(){

                   alert("please enter the song");

                   },
             contentType:"application/json"
                   });
           }
           else{
                    $("#songerror").show();

               }
                   });

}
</script>
</body
</html>