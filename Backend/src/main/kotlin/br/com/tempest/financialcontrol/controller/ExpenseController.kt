package br.com.tempest.financialcontrol.controller

import br.com.tempest.financialcontrol.domain.ExpenseDomain
import br.com.tempest.financialcontrol.service.ExpenseService
import org.apache.coyote.Response
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/v1/expenses")
class ExpenseController {

    @Autowired
    lateinit var service:ExpenseService

    @GetMapping
    fun getExpenses():ResponseEntity<List<ExpenseDomain>> = ResponseEntity(service.getExpenses(),HttpStatus.OK)

    @PostMapping
    fun addExpense(@RequestBody domain:ExpenseDomain):ResponseEntity<*> =
            ResponseEntity(service.addExpense(domain), HttpStatus.CREATED)

    @DeleteMapping("/{id}")
    fun deleteExpense(@PathVariable("id") id:Integer):ResponseEntity<*> =
            ResponseEntity(service.deleteExpense(id),HttpStatus.OK)
}