; ModuleID = 'example_simple_project/src/utils.c'
source_filename = "example_simple_project/src/utils.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @print_result(i8* %0, i32 %1) #0 !dbg !8 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %5, metadata !19, metadata !DIExpression()), !dbg !20
  %6 = load i8*, i8** %3, align 8, !dbg !21
  %7 = load i32, i32* %4, align 4, !dbg !22
  %8 = call i32 @format_output(i8* %6, i32 %7), !dbg !23
  store i32 %8, i32* %5, align 4, !dbg !20
  ret void, !dbg !24
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @format_output(i8* %0, i32 %1) #0 !dbg !25 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  call void @llvm.dbg.declare(metadata i8** %3, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !30, metadata !DIExpression()), !dbg !31
  %5 = load i32, i32* %4, align 4, !dbg !32
  ret i32 %5, !dbg !33
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @log_message(i8* %0) #0 !dbg !34 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  call void @llvm.dbg.declare(metadata i8** %2, metadata !37, metadata !DIExpression()), !dbg !38
  %3 = load i8*, i8** %2, align 8, !dbg !39
  %4 = icmp ne i8* %3, null, !dbg !39
  br i1 %4, label %5, label %6, !dbg !41

5:                                                ; preds = %1
  br label %6, !dbg !42

6:                                                ; preds = %5, %1
  ret void, !dbg !44
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "example_simple_project/src/utils.c", directory: "/Users/hehang03/code/clover/tool/Control_flow_Analyzer")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"PIC Level", i32 2}
!7 = !{!"clang version 10.0.0 "}
!8 = distinct !DISubprogram(name: "print_result", scope: !1, file: !1, line: 16, type: !9, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{null, !11, !14}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "operation", arg: 1, scope: !8, file: !1, line: 16, type: !11)
!16 = !DILocation(line: 16, column: 31, scope: !8)
!17 = !DILocalVariable(name: "value", arg: 2, scope: !8, file: !1, line: 16, type: !14)
!18 = !DILocation(line: 16, column: 46, scope: !8)
!19 = !DILocalVariable(name: "formatted", scope: !8, file: !1, line: 18, type: !14)
!20 = !DILocation(line: 18, column: 9, scope: !8)
!21 = !DILocation(line: 18, column: 35, scope: !8)
!22 = !DILocation(line: 18, column: 46, scope: !8)
!23 = !DILocation(line: 18, column: 21, scope: !8)
!24 = !DILocation(line: 21, column: 1, scope: !8)
!25 = distinct !DISubprogram(name: "format_output", scope: !1, file: !1, line: 8, type: !26, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{!14, !11, !14}
!28 = !DILocalVariable(name: "operation", arg: 1, scope: !25, file: !1, line: 8, type: !11)
!29 = !DILocation(line: 8, column: 38, scope: !25)
!30 = !DILocalVariable(name: "value", arg: 2, scope: !25, file: !1, line: 8, type: !14)
!31 = !DILocation(line: 8, column: 53, scope: !25)
!32 = !DILocation(line: 10, column: 12, scope: !25)
!33 = !DILocation(line: 10, column: 5, scope: !25)
!34 = distinct !DISubprogram(name: "log_message", scope: !1, file: !1, line: 26, type: !35, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !11}
!37 = !DILocalVariable(name: "message", arg: 1, scope: !34, file: !1, line: 26, type: !11)
!38 = !DILocation(line: 26, column: 30, scope: !34)
!39 = !DILocation(line: 28, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 28, column: 9)
!41 = !DILocation(line: 28, column: 9, scope: !34)
!42 = !DILocation(line: 30, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !1, line: 28, column: 18)
!44 = !DILocation(line: 31, column: 1, scope: !34)
