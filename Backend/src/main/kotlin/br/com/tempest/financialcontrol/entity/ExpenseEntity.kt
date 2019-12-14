package br.com.tempest.financialcontrol.entity

import javax.persistence.Entity
import java.util.*
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Table

@Entity
@Table(name="Expenses")
data class ExpenseEntity (

        @Id
        @GeneratedValue
        val id:Integer? = null,
        val name:String,
        val type:String,
        val value:Double,
        val date:Date
)