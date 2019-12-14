package br.com.tempest.financialcontrol.domain

import java.util.*

data class ExpenseDomain (
        val id:Integer? = null,
        val name:String,
        val type:String,
        val value:Double,
        val date:Date
)