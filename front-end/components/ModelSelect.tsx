import { FC } from 'react';
import React from "react";

export type OpenAIModel = 'gpt-3.5-turbo' | 'gpt-4';
export type BPF = 'libbpf' | 'bpftrace';

interface Props {
  model: OpenAIModel;
  onChange: (model: OpenAIModel) => void;
}

interface BPFProps {
  bpfType: BPF;
  onChange: (bpfType: BPF) => void;
}

export const ModelSelect: FC<Props> = ({ model, onChange }) => {
  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    onChange(e.target.value as OpenAIModel);
  };

  return (
    <div>
      <select
        className="h-[40px] w-[140px] rounded-md border border-gray-300 px-3 py-2 text-black shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
        value={model}
        onChange={handleChange}
      >
        <optgroup label="GPT">
          <option value="gpt-3.5">GPT-3.5</option>
          <option value="gpt-4">GPT-4</option>
        </optgroup>
        <optgroup label="Hugging Face">
          <option value="wizardlm">Wizardlm</option>
          <option value="exllamma">Exllamma</option>
          <option value="codellama">Codellama</option>
        </optgroup>
      </select>
    </div>
  );
};

export const BPFSelect: FC<BPFProps> = ({ bpfType, onChange }) => {
  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    onChange(e.target.value as BPF);
  };

  return (
    <div>
      <select
        className="h-[40px] w-[140px] rounded-md border border-gray-300 px-3 py-2 text-black shadow-sm focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm"
        value={bpfType}
        onChange={handleChange}
      >
        <option value="libbpf">libbpf</option>
        <option value="bpftrace">bpftrace</option>
      </select>
    </div>
  );
};