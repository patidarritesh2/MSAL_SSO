import { Response } from "express"

export const sendSuccessResponse = (res: Response, data: Array<any>) => {
	res.send({
		success: true,
		data: data,
		errors: null,
	})
}


export const sendSuccessResponseArray = (res: Response, data: any, msg?:string, isContra?:boolean) => {
	res.send({
		code:200,
		status:true,
		data: data,
		message:msg,
		errors: null,
		isContra: isContra,
	})
}

export const sendErrorResponse = (res: Response, statusCode: number, errors: Array<any>) => {
	res.status(statusCode).send({
		success: false,
		data: null,
		errors: errors
	})
}