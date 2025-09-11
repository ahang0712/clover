; ModuleID = './dataset/c-src/response-1/gemini-2.5-pro/svp_simple_011_001_filtered.c'
source_filename = "./dataset/c-src/response-1/gemini-2.5-pro/svp_simple_011_001_filtered.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@svp_simple_011_001_global_var1 = common global i32 0, align 4, !dbg !0
@svp_simple_011_001_global_var2 = common global i32 0, align 4, !dbg !6
@svp_simple_011_001_u = common global i32* null, align 8, !dbg !12
@svp_simple_011_001_global_var3 = common global i32 0, align 4, !dbg !10

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_011_001_main() #0 !dbg !22 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  call void (...) @init(), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %1, metadata !26, metadata !DIExpression()), !dbg !28
  store i32* @svp_simple_011_001_global_var1, i32** %1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %2, metadata !29, metadata !DIExpression()), !dbg !30
  store i32* @svp_simple_011_001_global_var1, i32** %2, align 8, !dbg !30
  store i32* @svp_simple_011_001_global_var2, i32** @svp_simple_011_001_u, align 8, !dbg !31
  store i32* @svp_simple_011_001_global_var3, i32** @svp_simple_011_001_u, align 8, !dbg !32
  ret void, !dbg !33
}

declare void @init(...) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_011_001_isr_1() #0 !dbg !34 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %1, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %2, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %3, metadata !39, metadata !DIExpression()), !dbg !40
  store i32* @svp_simple_011_001_global_var1, i32** %3, align 8, !dbg !40
  %4 = load i32*, i32** %3, align 8, !dbg !41
  %5 = load i32, i32* %4, align 4, !dbg !42
  store i32 %5, i32* %1, align 4, !dbg !43
  %6 = load i32*, i32** @svp_simple_011_001_u, align 8, !dbg !44
  %7 = load volatile i32, i32* %6, align 4, !dbg !45
  store i32 %7, i32* %2, align 4, !dbg !46
  ret void, !dbg !47
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "svp_simple_011_001_global_var1", scope: !2, file: !8, line: 2, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "dataset/c-src/response-1/gemini-2.5-pro/svp_simple_011_001_filtered.c", directory: "/Users/hehang03/code/clover/tool/Operation_Analyzer")
!4 = !{}
!5 = !{!0, !6, !10, !12}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "svp_simple_011_001_global_var2", scope: !2, file: !8, line: 3, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "./dataset/c-src/response-1/gemini-2.5-pro/svp_simple_011_001_filtered.c", directory: "/Users/hehang03/code/clover/tool/Operation_Analyzer")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "svp_simple_011_001_global_var3", scope: !2, file: !8, line: 4, type: !9, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "svp_simple_011_001_u", scope: !2, file: !8, line: 5, type: !14, isLocal: false, isDefinition: true)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !9)
!16 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{!"clang version 10.0.0 "}
!22 = distinct !DISubprogram(name: "svp_simple_011_001_main", scope: !8, file: !8, line: 6, type: !23, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocation(line: 7, column: 3, scope: !22)
!26 = !DILocalVariable(name: "p", scope: !22, file: !8, line: 8, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!28 = !DILocation(line: 8, column: 8, scope: !22)
!29 = !DILocalVariable(name: "q", scope: !22, file: !8, line: 9, type: !27)
!30 = !DILocation(line: 9, column: 8, scope: !22)
!31 = !DILocation(line: 10, column: 24, scope: !22)
!32 = !DILocation(line: 11, column: 24, scope: !22)
!33 = !DILocation(line: 12, column: 1, scope: !22)
!34 = distinct !DISubprogram(name: "svp_simple_011_001_isr_1", scope: !8, file: !8, line: 13, type: !23, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DILocalVariable(name: "reader1", scope: !34, file: !8, line: 14, type: !9)
!36 = !DILocation(line: 14, column: 7, scope: !34)
!37 = !DILocalVariable(name: "reader2", scope: !34, file: !8, line: 14, type: !9)
!38 = !DILocation(line: 14, column: 16, scope: !34)
!39 = !DILocalVariable(name: "m", scope: !34, file: !8, line: 15, type: !27)
!40 = !DILocation(line: 15, column: 8, scope: !34)
!41 = !DILocation(line: 16, column: 14, scope: !34)
!42 = !DILocation(line: 16, column: 13, scope: !34)
!43 = !DILocation(line: 16, column: 11, scope: !34)
!44 = !DILocation(line: 17, column: 14, scope: !34)
!45 = !DILocation(line: 17, column: 13, scope: !34)
!46 = !DILocation(line: 17, column: 11, scope: !34)
!47 = !DILocation(line: 18, column: 1, scope: !34)
