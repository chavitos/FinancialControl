package br.com.tempest.financialcontrol.controller

import br.com.tempest.financialcontrol.domain.ExpenseGraphDomain
import br.com.tempest.financialcontrol.service.GraphService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/v1/graph")
class ExpenseGraphController {

    @Autowired
    lateinit var service:GraphService

    @GetMapping
    fun getGraph():ResponseEntity<List<ExpenseGraphDomain>> = ResponseEntity(service.getGraph(),HttpStatus.OK)
}