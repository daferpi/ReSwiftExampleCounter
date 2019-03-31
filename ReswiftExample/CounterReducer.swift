//
// Created by abelFernandez on 20/10/2018.
// Copyright (c) 2018 daferpi. All rights reserved.
//

import ReSwift

func counterReducer(action:Action, state:AppState?) -> AppState {

    var state = state ?? AppState()

    switch action {
    case _ as CounterActionIncrease:
        state.count += 1
    case _ as CounterActionDecrease:
        state.count -= 1
    default:
        break
    }

    return state

}

