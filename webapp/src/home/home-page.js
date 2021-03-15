import React, { Fragment, useState } from 'react'
import { css } from '@emotion/core'
import { useQuery, useMutation } from '@apollo/client'
import CreateTransaction from '../gql/CreateTransaction.gql'
import DeleteTransaction from '../gql/DeleteTransaction.gql'
import GetTransactions from '../gql/transactions.gql'
import GetCategories from '../gql/categories.gql'
import GetCompanies from '../gql/companies.gql'
import GetMerchants from '../gql/merchants.gql'
import GetUsers from '../gql/users.gql'
import NewTransaction from '../gql/NewTransactionFragment.gql'
import UpdateTransaction from '../gql/updateTransaction.gql'
import TxTable from '../components/transactions/TxTable'
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  InputAdornment,
  MenuItem,
  TextField
} from '@material-ui/core'
import { makeStyles } from '@material-ui/core/styles'
import { convertDollarsToCents, validateDollarCents } from '../helpers/currency/currency'

export function Home () {
  const [isTxModalOpen, setIsTxModalOpen] = useState(false)
  const [action, setAction] = useState('')
  const [amount, setAmount] = useState('')
  const [categoryId, setCategoryId] = useState('')
  const [chargeType, setChargeType] = useState('')
  const [companyId, setCompanyId] = useState('')
  const [description, setDescription] = useState('')
  const [id, setId] = useState('')
  const [merchantId, setMerchantId] = useState('')
  const [isValidAmount, setAmountValidation] = useState(true)
  const [userId, setUserId] = useState('')

  const {
    loading: txLoading,
    error: txError,
    data: txData,
    refetch: txRefetch = {}
  } = useQuery(GetTransactions, { variables: { orderBy: 'INSERTED_AT_DESC' } })

  const {
    loading: catLoading,
    error: catError,
    data: catData
  } = useQuery(GetCategories)

  const {
    loading: comLoading,
    error: comError,
    data: comData
  } = useQuery(GetCompanies)

  const {
    loading: merLoading,
    error: merError,
    data: merData
  } = useQuery(GetMerchants)

  const {
    loading: useLoading,
    error: useError,
    data: useData
  } = useQuery(GetUsers)

  const [updateTransaction] = useMutation(UpdateTransaction, {
    variables: {
      amount: convertDollarsToCents(amount),
      ...categoryId && { categoryId },
      companyId,
      credit: chargeType === 'credit',
      debit: chargeType === 'debit',
      description,
      id,
      merchantId,
      userId
    },
    update (cache, { data: { updateTransaction } }) {
      cache.modify({
        id: cache.identify(updateTransaction),
        fields: {
          transactions (existingTransactions = []) {
            const newTransactionRef = cache.writeFragment({
              data: updateTransaction,
              fragment: NewTransaction
            })
            return [...existingTransactions, newTransactionRef]
          }
        }
      })
    }
  })

  const [createTransaction] = useMutation(CreateTransaction, {
    variables: {
      amount: convertDollarsToCents(amount),
      ...categoryId && { categoryId },
      companyId,
      credit: chargeType === 'credit',
      debit: chargeType === 'debit',
      description,
      merchantId,
      userId
    },
    update (cache, { data: { createTransaction } }) {
      cache.modify({
        fields: {
          transactions (existingTransactions = []) {
            const newTransactionRef = cache.writeFragment({
              data: createTransaction,
              fragment: NewTransaction
            })
            return [...existingTransactions, newTransactionRef]
          }
        }
      })
    }
  })
  const [deleteTransaction] = useMutation(DeleteTransaction, {
    variables: {
      id
    },
    update (cache, { data: { deleteTransaction } }) {
      cache.modify({
        id: cache.identify(deleteTransaction),
        fields: {
          transactions (existingTransactions, { DELETE }) {
            return DELETE
          }
        }
      })
    }
  })

  function setDefaultState () {
    setAction('')
    setAmount('')
    setCategoryId('')
    setChargeType('')
    setCompanyId('')
    setDescription('')
    setId('')
    setMerchantId('')
    setAmountValidation(true)
    setIsTxModalOpen(false)
    setUserId('')
  }

  function handleAmountChange (e) {
    setAmount(e.target.value)
    const isValid = validateDollarCents(e.target.value)
    setAmountValidation(isValid)
  }

  function handleCategoryChange (e) {
    setCategoryId(e.target.value)
  }

  function handleChargeTypeChange (e) {
    setChargeType(e.target.value)
  }

  function handleCompanyChange (e) {
    setCompanyId(e.target.value)
  }

  function handleDescriptionChange (e) {
    setDescription(e.target.value)
  }

  function handleMerchantChange (e) {
    setMerchantId(e.target.value)
  }

  function handleOpenTxModal (data) {
    if (data && (data.action === 'delete' || data.action === 'edit')) {
      setAmount(data.dollarAmount)
      setAction(data.action)
      setCategoryId(data.categoryId)
      setChargeType(data.chargeType)
      setCompanyId(data.companyId)
      setDescription(data.description)
      setId(data.id)
      setMerchantId(data.merchantId)
      setUserId(data.userId)
    }
    setIsTxModalOpen(true)
  }

  function handleCreateTransaction () {
    handleCloseTxModal()
    createTransaction()
  }

  function handleDeleteTransaction () {
    handleCloseTxModal()
    deleteTransaction()
  }

  function handleSaveTransaction () {
    handleCloseTxModal()
    updateTransaction()
  }

  function handleCloseTxModal () {
    setDefaultState()
  }

  function handleUserChange (e) {
    setUserId(e.target.value)
  }

  function setModalConfirmOnClick () {
    switch (action) {
      case 'edit':
        return handleSaveTransaction
      case 'delete':
        return handleDeleteTransaction
      default:
        return handleCreateTransaction
    }
  }

  function setDialogTitle () {
    switch (action) {
      case 'edit':
        return 'Edit Transaction'
      case 'delete':
        return 'Delete Transaction'
      default:
        return 'Add Transaction'
    }
  }

  const classes = textFielStyles()

  if (txLoading || useLoading || catLoading || merLoading || comLoading) {
    return (
      <Fragment>
        Loading...
      </Fragment>
    )
  }

  if (txError || useError || catError || merError || comError) {
    return (
      <Fragment>
        ¯\_(ツ)_/¯
      </Fragment>
    )
  }

  const confirmDisabled = action === 'delete' ? false : !amount || !isValidAmount || !description || !chargeType || !merchantId || !userId
  const modalConfirmOnClick = setModalConfirmOnClick()
  const dialogTitle = setDialogTitle()
  const confirmText = action === 'delete' ? 'Delete' : 'Save'

  return (
    <Fragment>
      <div css={buttonContainerStyle}>
        <Button color='primary' onClick={handleOpenTxModal} variant='contained'>Add Transaction</Button>
      </div>
      <TxTable data={txData.transactions} handleOpenTxModal={handleOpenTxModal} refetchTransactions={txRefetch} />
      <Dialog onClose={handleCloseTxModal} open={isTxModalOpen}>
        <DialogTitle id='form-dialog-title'>{dialogTitle}</DialogTitle>
        {action === 'delete' ? (
          <DialogContent className={classes.root} dividers>
            Are you sure you want to delete this transaction?
          </DialogContent>
        ) : (
          <DialogContent className={classes.root} dividers>
            <div css={dialogRowStyles}>
              <TextField
                label='Description'
                onChange={handleDescriptionChange}
                required
                value={description}
              />
              <TextField
                label='Debit/Credit'
                onChange={handleChargeTypeChange}
                required
                select
                value={chargeType}
              >
                <MenuItem value='debit'>Debit</MenuItem>
                <MenuItem value='credit'>Credit</MenuItem>
              </TextField>
              <TextField
                InputProps={{ startAdornment: <InputAdornment position='start'>$</InputAdornment> }}
                error={!isValidAmount}
                helperText={!isValidAmount && 'must use ##.# format'}
                label='Amount'
                onChange={handleAmountChange}
                required
                value={amount}
              />
            </div>
            <div css={dialogRowStyles}>
              <TextField
                label='Category'
                onChange={handleCategoryChange}
                select
                value={categoryId}
              >
                {
                  catData.categories.map(cat => {
                    const { id, name } = cat
                    return (
                      <MenuItem key={`category-${id}`} value={id}>{name}</MenuItem>
                    )
                  })
                }
              </TextField>
              <TextField
                label='Merchant'
                onChange={handleMerchantChange}
                required
                select
                value={merchantId}
              >
                {
                  merData.merchants.map(mer => {
                    const { id, name } = mer
                    return (
                      <MenuItem key={`merchant-${id}`} value={id}>{name}</MenuItem>
                    )
                  })
                }
              </TextField>
            </div>
            <div css={dialogRowStyles}>
              <TextField
                label='Company'
                onChange={handleCompanyChange}
                required
                select
                value={companyId}
              >
                {
                  comData.companies.map(com => {
                    const { id, name } = com
                    return (
                      <MenuItem key={`company-${id}`} value={id}>{name}</MenuItem>
                    )
                  })
                }
              </TextField>
              <TextField
                label='User'
                onChange={handleUserChange}
                required
                select
                style={{ margin: '15px 30px' }}
                value={userId}
              >
                {
                  useData.users.map(use => {
                    const { id, firstName, lastName } = use
                    return (
                      <MenuItem key={`user-${id}`} value={id}>{`${firstName} ${lastName}`}</MenuItem>
                    )
                  })
                }
              </TextField>
            </div>
          </DialogContent>
        )}
        <DialogActions>
          <Button color='primary' onClick={handleCloseTxModal} variant='contained'>
            Cancel
          </Button>
          <Button color='primary' disabled={confirmDisabled} onClick={modalConfirmOnClick} variant='contained'>
            {confirmText}
          </Button>
        </DialogActions>
      </Dialog>
    </Fragment>
  )
}

const dialogRowStyles = css`
  display: flex;
  justify-content: 'space-between;
`
const buttonContainerStyle = css`
  margin: 20px;
`

const textFielStyles = makeStyles({
  root: {
    '& .MuiTextField-root': {
      width: '25ch',
      margin: '15px 30px'
    }
  }
})
