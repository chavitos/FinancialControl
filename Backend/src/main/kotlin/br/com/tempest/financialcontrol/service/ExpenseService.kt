package br.com.tempest.financialcontrol.service

import br.com.tempest.financialcontrol.domain.ExpenseDomain
import br.com.tempest.financialcontrol.entity.ExpenseEntity
import br.com.tempest.financialcontrol.repository.ExpenseRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import kotlin.streams.toList

@Service
class ExpenseService {

    @Autowired
    lateinit var repository:ExpenseRepository

    fun getExpenses():List<ExpenseDomain> {
        val expenses = repository.findAll()

        return expenses.stream().map { e -> toDomain(e) }.toList()
    }

    fun addExpense(domain:ExpenseDomain) {
        val entity = toEntity(domain)

        repository.save(entity)
    }

    fun deleteExpense(id:Integer) {
        repository.deleteById(id)
    }

    private fun toDomain(entity:ExpenseEntity):ExpenseDomain {
        return ExpenseDomain(id = entity.id, name = entity.name, type = entity.type, value = entity.value, date = entity.date)
    }

    private fun toEntity(domain:ExpenseDomain):ExpenseEntity {
        return ExpenseEntity(name = domain.name, type = domain.type, value = domain.value, date = domain.date)
    }
}