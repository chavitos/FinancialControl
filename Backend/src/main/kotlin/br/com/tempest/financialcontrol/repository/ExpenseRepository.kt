package br.com.tempest.financialcontrol.repository

import br.com.tempest.financialcontrol.entity.ExpenseEntity
import org.springframework.data.jpa.repository.JpaRepository

interface ExpenseRepository:JpaRepository<ExpenseEntity,Integer> {

}