; ModuleID = 'svp_simple_506_001.bc'
source_filename = "./svp_simple_506_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@glob = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @f() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !10
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !10
  %3 = load i32, i32* @glob, align 4, !dbg !11, !tbaa !12
  %4 = add nsw i32 %3, 1, !dbg !16
  store i32 %4, i32* %1, align 4, !dbg !17, !tbaa !12
  %5 = load i32, i32* @glob, align 4, !dbg !18, !tbaa !12
  %6 = add nsw i32 %5, 1, !dbg !19
  store i32 %6, i32* @glob, align 4, !dbg !20, !tbaa !12
  call void @exit(i32 0) #4, !dbg !21
  unreachable, !dbg !21

7:                                                ; No predecessors!
  ret void, !dbg !22
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_506_001_isr_1(i8* %0) #0 !dbg !23 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !24
  %4 = bitcast i32* %3 to i8*, !dbg !26
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !26
  %5 = load i32, i32* @glob, align 4, !dbg !27, !tbaa !12
  %6 = add nsw i32 %5, 1, !dbg !28
  store i32 %6, i32* %3, align 4, !dbg !29, !tbaa !12
  %7 = load i32, i32* @glob, align 4, !dbg !30, !tbaa !12
  %8 = add nsw i32 %7, 1, !dbg !31
  store i32 %8, i32* @glob, align 4, !dbg !32, !tbaa !12
  %9 = bitcast i32* %3 to i8*, !dbg !33
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #3, !dbg !33
  ret void, !dbg !33
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @svp_simple_506_001_main() #0 !dbg !34 {
  call void @f(), !dbg !35
  store i32 8, i32* @glob, align 4, !dbg !36, !tbaa !12
  ret i32 0, !dbg !37
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_506_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "f", scope: !8, file: !8, line: 8, type: !9, scopeLine: 8, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_506_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 9, column: 3, scope: !7)
!11 = !DILocation(line: 9, column: 13, scope: !7)
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !DILocation(line: 9, column: 17, scope: !7)
!17 = !DILocation(line: 9, column: 7, scope: !7)
!18 = !DILocation(line: 10, column: 10, scope: !7)
!19 = !DILocation(line: 10, column: 14, scope: !7)
!20 = !DILocation(line: 10, column: 8, scope: !7)
!21 = !DILocation(line: 13, column: 3, scope: !7)
!22 = !DILocation(line: 14, column: 1, scope: !7)
!23 = distinct !DISubprogram(name: "svp_simple_506_001_isr_1", scope: !8, file: !8, line: 16, type: !9, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !14, i64 0}
!26 = !DILocation(line: 17, column: 3, scope: !23)
!27 = !DILocation(line: 17, column: 13, scope: !23)
!28 = !DILocation(line: 17, column: 17, scope: !23)
!29 = !DILocation(line: 17, column: 7, scope: !23)
!30 = !DILocation(line: 18, column: 8, scope: !23)
!31 = !DILocation(line: 18, column: 12, scope: !23)
!32 = !DILocation(line: 18, column: 7, scope: !23)
!33 = !DILocation(line: 21, column: 1, scope: !23)
!34 = distinct !DISubprogram(name: "svp_simple_506_001_main", scope: !8, file: !8, line: 23, type: !9, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 28, column: 3, scope: !34)
!36 = !DILocation(line: 30, column: 8, scope: !34)
!37 = !DILocation(line: 31, column: 3, scope: !34)
