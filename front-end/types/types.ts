export type OpenAIModel = 'gpt-3.5-turbo' | 'gpt-4';
export type BPF = 'libbpf' | 'bpftrace';

export interface TranslateBody {
  user_query: string;
  bpfType: string;
  model: OpenAIModel;
  apiKey: string;
}

export interface TranslateResponse {
  code: string;
}

export declare interface ParsedEvent {
  type: 'event'
  event?: string
  id?: string
  data: string
}

export declare interface ReconnectInterval {
  type: 'reconnect-interval'
  value: number
}