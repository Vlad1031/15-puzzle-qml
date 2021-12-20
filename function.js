function neighboring(index, idx){
    if (index % 4 < 3 && index + 1 === idx)
        return true;
    if (index % 4 > 0 && index - 1 === idx)
        return true;
    if (index < 12 && index + 4 === idx)
        return true;
    if (index >= 4 && index - 4 === idx)
        return true;
    return false;
}
function mix(){
    var to, from
    while (0 !== from){
        from = Math.floor(Math.random() * 16)
        to = Math.floor(Math.random() * 16)

        var temp = theModel.get(from).number
        theModel.get(from).number = theModel.get(to).number
        theModel.get(to).number = temp
    }
}
function find_zero(){
    for(var e = 0; e < theModel.count; e++)
        if(theModel.get(e).number === 0)
            return e
}
function formula(){
    var k = 0

    for(var iter = 0; iter < 16; iter++){
        for(var iter2 = iter + 1; iter2 < 16; iter2++){
            if(theModel.get(iter) !== 0 && theModel.get(iter2) !== 0){
                if(theModel.get(iter).number > theModel.get(iter2).number){
                    k++
                }
            }
        }
    }

    var number_zero = Math.floor((find_zero() / 4)) + 1
    var N = k + number_zero
    var res = N % 2
    return res
}

function shuffle(){
    do{
        mix()
    }while(formula() === 0)
}
